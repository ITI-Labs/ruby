require_relative 'handler'

class ConsoleHandler < Handler
  def handle(event)
    puts event
  end
end
