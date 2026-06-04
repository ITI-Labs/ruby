require_relative 'handler'

class FileHandler < Handler
  def initialize(log_path = 'lifetrack.log')
    @log_path = log_path
  end

  def handle(event)
    File.open(@log_path, 'a') { |f| f.puts event }
  end
end
