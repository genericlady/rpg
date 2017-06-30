class Player
  def to_s
    "@"
  end
end

class View
  attr_accessor :board

  def initialize(board=[[Player.new,0,0],[0,0,0]])
    @board = board
  end

  def render
    system "clear"
    render_board
    render_menu
  end

  def render_board
    board.each do |row|
      row.each { |cell| print cell.to_s }
      print "\n"
    end
    print "\n"
  end

  def render_menu
    puts "To move try WASD or HJKL"
  end
end

