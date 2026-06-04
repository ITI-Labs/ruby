require_relative 'handler'

class StatsHandler < Handler
  def initialize
    @events = []
    at_exit { print_summary }
  end

  def handle(event)
    @events << event
  end

  private

  def print_summary
    return if @events.empty?

    puts
    puts "=" * 50
    puts "  Session Summary"
    puts "=" * 50
    puts "  Total events : #{@events.size}"
    puts "  Total time   : #{@events.sum(&:duration)} min"

    by_type = @events.group_by(&:type)
    puts "  By type:"
    by_type.each { |type, evs| puts "    #{type.capitalize}: #{evs.size} (#{evs.sum(&:duration)} min)" }

    durations = @events.map(&:duration)
    avg = durations.sum.to_f / durations.size
    puts "  Avg duration: #{avg.round(1)} min"
    puts "=" * 50
  end
end
