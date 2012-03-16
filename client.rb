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
  deux
REQUESTS

call_server(HOST, PORT) do
  commands.split("\n").each do |command|
    puts "> #{command}"
    puts send_request command
  end
  puts send_request "OK CLOSE"
end
