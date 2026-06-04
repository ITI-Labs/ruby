require_relative 'event'
require_relative 'event_router'
require_relative 'console_handler'
require_relative 'file_handler'
require_relative 'stats_handler'

router = EventRouter.new
router.register(ConsoleHandler.new)
router.register(FileHandler.new)
router.register(StatsHandler.new)

OPTIONS = {
  '1' => 'work',
  '2' => 'study',
  '3' => 'exercise',
  '4' => 'meal'
}.freeze

loop do
  puts
  puts "=== LifeTrack ==="
  puts "1. Log a work session"
  puts "2. Log a study session"
  puts "3. Log an exercise session"
  puts "4. Log a meal"
  puts "5. Exit"
  print "\nChoose an option: "

  choice = gets.chomp.strip
  break if choice == '5'

  type = OPTIONS[choice]
  unless type
    puts "Invalid option. Try again."
    next
  end

  print "Description: "
  description = gets.chomp.strip

  print "Duration (minutes): "
  duration = gets.chomp.to_i

  event = Event.new(type: type, description: description, duration: duration)
  router.dispatch(event)
  puts "✓ Event logged."
end
