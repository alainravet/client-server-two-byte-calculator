# start the server in a dedicated console with
#   > ruby server.rb

PORT = 6666

EOC_COMMAND  = "OK CLOSE"
EOC_RESPONSE = "CLOSED"

require 'socket'
require_relative 'calculator'

def start_server
  server  = TCPServer.new PORT
  @client = server.accept
  loop {
    request = @client.gets
    puts "request = #{request.inspect}"
    request.chomp!
    if request == EOC_COMMAND
      send_response EOC_RESPONSE
      break
    else
      send_response Calculator.process_input(request)
    end
  }
ensure
  @client.close
end


def send_response(result)
  @client.puts result
  puts result
end

# ------------------------------------------

start_server