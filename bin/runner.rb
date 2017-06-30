require_relative "../rpg.rb"

loop do
  View.new.render
  system("stty raw -echo")
  char = STDIN.read_nonblock(1) rescue nil
  system("stty -raw echo")
  break if /q/i =~ char
  sleep(2)
end
