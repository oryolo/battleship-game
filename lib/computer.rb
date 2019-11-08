require_relative 'grid'
require_relative 'player'

class Computer < Player
  def initizlize(name)
    @name = name
  end

  def pick_target
    letters_array = Grid::LETTERS
    numbers_array = (1..10).to_a
    set = []

    n = 0
    while n < 10 do 
      random_num = rand(0..9)
      random_num2 = rand(0..9)
      combo = letters_array[random_num].to_s + numbers_array[random_num2].to_s
      set << combo
      n += 1
    end
    set
  end

  def shoot(target_player)
    target = pick_target.sample
    puts "Computer shoots in #{target}"
    target = target.split('')
    row_index = Grid::LETTERS.find_index(target.shift)
    column_index = target.join('').to_i - 1

    if target_player.grid.board[row_index][column_index].to_s.match?(/[1-4]/)
      puts 'Hit!'
      @opponent_grid.board[row_index][column_index] = 'x'
      @score += 1
      puts target_player.grid.board[row_index][column_index]
    elsif @opponent_grid.board[row_index][column_index] == 'x' 
      puts 'Already taken!'
    else
      puts 'Miss!'
    end
  end
end