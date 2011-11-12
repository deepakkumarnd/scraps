#!/usr/bin/env ruby

require 'logger'

# usage with inheritance

class LoggerSample < Logger::Application
  def initialize
    super('LoggerSample')
    logdev = "sample.log" # log device can be a filename or STDERR,STDOUT
    self.log = logdev
    @log.datetime_format = "%d-%b-%Y@%H:%M:%S"
    self.level = INFO
    # default level is DEBUG other are
    # Logger::DEBUG
    # Logger::WARN
    # Logger::ERROR
    # Logger::FATAL
    # Logger::INFO
    # Logger::UNKNOWN
  end

  def run
    @log.info { "The application is started"}
    @log.debug {"Debug message here"}
    @log.warn {"Warning message here"}
    @log.error {"Error message here"}
    @log.fatal {"Fatal error message here"}
    @log.unknown {"Unknown error message here"}
  end

end





# usage without inheritance
def do_log(log)
  log.info { "The application is started"}
  log.debug {"Debug message here"}
  log.warn {"Warning message here"}
  log.error {"Error message here"}
  log.fatal {"Fatal error message here"}
  log.unknown {"Unknown error message here"}
end

def sample_logger
  logdev = 'sample.log'
  log = Logger.new(logdev)
  log.level = Logger::INFO
  log.datetime_format = "%d-%b-%Y@%H:%M:%S"
  do_log(log)
end

# here a new logfile is created after each shift_size
# log age means maximum number of files
def sample_logger_shifting
  logdev = 'sample.log'
  shift_age = 3
  shift_size = 1024
  log = Logger.new(logdev, shift_age, shift_size)
  (1..5).each { do_log(log) }
end

puts "1) Logger inheritance sample "
puts "2) Logger without inheritance"
puts "3) Logger logger shifting"
puts "4) Enter choice:"
option = gets.chomp.to_i

case option
  when 1 then LoggerSample.new().start
  when 2 then sample_logger
  when 3 then sample_logger_shifting
else
  puts "Invalid option"
end

puts 'check for output in your current directory'
puts 'It is available as sample.log*'