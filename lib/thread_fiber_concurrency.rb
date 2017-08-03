# program simulates a client server scenario

puts "Curreent process id: #{Process.pid}"

MAX_QUEUE_SIZE = 50
MAX_CONCURRENCY = 5

class Request < Struct.new(:params, :socket) ; end
class Response < Struct.new(:response_code, :data) ; end

class Server

  attr_reader :queue, :processed_count

  def initialize
    @queue = []
    @processed_count = 0
  end

  def push(request)

    if request_count <= MAX_QUEUE_SIZE
      @queue.push(request)
    else
      puts "Queue full, rejecting request #{request.params}"
    end
  end

  def request_count
    @queue.size
  end

  def start

    @fiber = Fiber.new do
      loop do
        item = @queue.shift

        if item.nil?
          Fiber.yield
        else
          run(item)
        end
      end
    end

    process
  end

  def process
    @fiber.resume
  end
  

  def simulate_running
    sleep(rand(0.1..0.3))
  end

  def run(request)
    # time taken to process the request
    simulate_running
    increment_processed_requests_count!
    r = Response.new(200, request.params.to_s)
  end

  def increment_processed_requests_count!
    @processed_count += 1
  end
end


server = Server.new
server.start

# Simulating incoming requests
Thread.new do
  loop do
    rand(MAX_CONCURRENCY).times do
      request = Request.new(rand(100), Time.now.to_i)
      server.push(request)
    end

    sleep(rand(0.3..0.5))
  end
end

# monitoring thread

Thread.new do
  before =  {}
  after  = {}

  loop do
    # before[:total_freed_objects] = GC.stat(:total_freed_objects)
    # before[:total_allocated_objects] = GC.stat(:total_allocated_objects)
    processed_count_before = server.processed_count
    time_before = Time.now.to_i
    sleep 10
    # after[:total_freed_objects] = GC.stat(:total_freed_objects)
    # after[:total_allocated_objects] = GC.stat(:total_allocated_objects)
    processed_count_after = server.processed_count
    time_after = Time.now.to_i

    diff = processed_count_after - processed_count_before
    puts "Procesing rate: #{diff/(time_after - time_before).to_f}"
    puts "Load #{server.request_count/MAX_QUEUE_SIZE.to_f*100}"
    # before.each do |key, val|
    #   diff = after[key] - val
    #   puts "#{key.to_s.capitalize.gsub('_',' ')} : #{diff}"
    # end
  end
end

loop do
  if server.request_count > 0
    server.process
  end
end

