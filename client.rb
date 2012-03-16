# start the client in a dedicated console with
#   > ruby client.rb
# ------------------------------------------

HOST = 'localhost'
PORT = 6666

require 'socket'

def call_server(host, port)
  @server = TCPSocket.open(host, port)
  yield
ensure
  @server.close
end

def send_request(command)
  @server.puts command
  @server.gets.chomp
end


# ------------------------------------------
commands =<<REQUESTS.gsub /^\s+/, ""
  PLUS 1 2 3
  MINUS 10 2 3
  DIVIDE 100 2 5
  TIMES 100 2 5

  PLUS 65535 1
  MINUS 1 2 3
  DIVIDE 100 0
  TIMES 65535 2
  invalid expression
  OK CLOSE
REQUESTS

call_server(HOST, PORT) do
  commands.split("\n").each do |command|
    puts command + ' ->'
    puts "\t" + send_request(command)
  end
end
