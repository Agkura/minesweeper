require_relative 'squares'
require_relative 'board'
require 'colorize'

class Minesweeper
  attr_reader :board

  def initialize
    @board = Board.new

    bombs = (1..100).to_a.shuffle!.map do |int|
      int > 25 ? Squares.new(false) : Squares.new(true)
    end

    board.grid.each do |row|
      row.each_index do |index|
        row[index] = bombs.pop
      end
    end

  end

  def render
    headers
    board.grid.each_with_index do |row, idx|
      print "#{idx} "
      row.each do |square|
        print square.show
      end
      print "\n"
    end
    nil
  end

  def headers
    print "  "
    (0...board.grid.length).each do |idx|
      print "#{idx} "
    end
    print "\n"
  end

  def get_input
    puts "pick a square"
    input = gets.chomp
    #r,2,3
    input = input.split(",")
    action = input.shift
    input = input.map(&:to_i)
    [action] + input ## ["r",2,3]
  end

  def click(input)
    action, pos = input.first, input.drop(1)
    board[pos].reveal if action == "r"
    board[pos].toggle_flag if action == "f"
  end


end
