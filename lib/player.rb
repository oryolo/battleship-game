require_relative 'grid'
require_relative 'ship'


class Player 
  attr_reader :name, :grid, :ships_collection, :opponent_grid, :score

  SHIP_TYPES = {
    'battleship': {size: 4, count: 1},
    'cruiser': {size: 3, count: 2},
    'destroyer': {size: 2, count: 3},
    'submarine': {size: 1, count: 4}
  }.freeze

  MAX_SCORE = SHIP_TYPES.inject(0) do |memo, (type, data)|
    memo += data[:size] * data[:count]
    memo
  end

  def initialize(name)
    @name = name
    @grid = Grid.new
    @opponent_grid = Grid.new
    @score = 0
    get_ships
    arrange_ships
  end
  
  def get_ships
    @ships_collection = []
    SHIP_TYPES.each do |type, data|
      data[:count].times { @ships_collection << Ship.new(type, data[:size]) }
    end
    @ships_collection
  end

  def arrange_ships
    @ships_collection.shuffle!
    @ships_collection.each do |ship|

      random_range = (0..Grid::SIZE - ship.size).to_a.shuffle

      if (ship.orientation == 'horizontal')
        random_rows = (0..Grid::SIZE - 1).to_a.shuffle

        success = false

        random_rows.each do |row| 
          random_range.each do |n|
            y1 = n
            y2 = y1 + ship.size - 1

            if (y1..y2).to_a.all? { |i| @grid.board[row][i] == ' ' }
              (y1..y2).to_a.each { |i| @grid.board[row][i] = ship.size }
              success = true
              break
            end
          end
          break if success
        end
      else
        random_cols = (0..Grid::SIZE - 1).to_a.shuffle
        
        success = false
                
        random_cols.each do |col|
          random_range.each do |n|
            x1 = n
            x2 = x1 + ship.size - 1

            if (x1..x2).to_a.all? { |i| @grid.board[i][col] == ' ' }
              (x1..x2).to_a.each { |i| @grid.board[i][col] = ship.size }
              success = true
              break
            end
          end
          break if success  
        end
      end
    end  
    @grid
  end
end