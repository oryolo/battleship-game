require_relative 'player'

class Human < Player
  def shoot(target_player)
    user_input = define_target
    puts user_input
    
    target = user_input.split('')
    row_index = Grid::LETTERS.find_index(target.shift)
    column_index = target.join('').to_i - 1
    
    # check opponents grid  and output result    
    if @opponent_grid.board[row_index][column_index] == 'x' 
      puts 'Already taken!'
    elsif target_player.grid.board[row_index][column_index].to_s.match?(/[1-4]/)
      puts 'Hit!'
      @opponent_grid.board[row_index][column_index] = 'x'
      @score += 1
      puts target_player.grid.board[row_index][column_index]
    else
      puts 'Miss!'
    end
  end

  def define_target
    input = nil
    while input.nil? do
      puts "#{@name}, enter target cell letter A-J and number 1-10 without space between (example: B5)"
      input = gets.chomp.capitalize.delete(' ')
      if !input.match?(/[A-J]\d+/)
        input = nil 
        puts "Please try again!"
      end
    end
    input
  end
end