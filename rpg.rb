require 'pry'

class Actor
  def to_s
    "@"
  end
end

class Board
  def initialize
    @board = Array.new(18) { Array.new(50, 0) }
  end

  def each(&block)
    board.each { |row| yield(row) }
  end

  def []=(x, y, observer)
    board[x][y] = observer
  end

  private
  attr_reader :board

end

class View
  attr_accessor :board

  def initialize(board=Board.new)
    @board = board
    board[10, 1] = Actor.new
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

