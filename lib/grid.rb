require 'colorize'

class Grid 
  attr_reader :board

  LETTERS = ('A'..'J').to_a
  SIZE = 10

  def initialize
    @board = []
    SIZE.times do |row_index|
      board[row_index] = Array.new(SIZE, ' ')
    end
    @board
  end

  def draw_board
    result = ""
    numbers = (0..10).to_a.join(' | ').yellow
    devider = "\n" + "-" * 42 + "\n"
    result += numbers
    result += devider
    n = 0
    while n <= 9 do
      @board.each do |row|
        row.join(' | ')
        result += LETTERS[n].to_s.yellow
        result += ' | '
        result += row.join(' | ')
        result += ' | '
        result += devider
        n += 1
      end
    end
    puts result
  end
end