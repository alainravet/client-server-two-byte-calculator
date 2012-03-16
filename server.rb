# start the server in a dedicated console with
#   > ruby server.rb

puts "press Ctrl-C to stop the server"


PORT = 6666

EOC_COMMAND  = "OK CLOSE"
EOC_RESPONSE = "CLOSED"

require 'socket'
require_relative 'lib/calculator'

def start_server
  server  = TCPServer.new PORT
  @client = server.accept
  loop {
    loop {
      request = @client.gets.chomp!
      puts "request : #{request}"
      if request == EOC_COMMAND
        send_response EOC_RESPONSE
        break
      else
        send_response Calculator.process_input(request)
      end
    }
    @client = server.accept
  }
ensure
  @client.close
end


def send_response(result)
  @client.puts result
end

# ------------------------------------------

start_server