require_relative 'player' 
require_relative 'human' 
require_relative 'computer' 
require_relative 'grid' 
require 'colorize'


class Game
  attr_reader :players

  def initialize
    initialize_players
  end

  def initialize_players
    puts "What is the name of Player 1?"
    name = gets.chomp
    @player1 = Human.new(name)

    puts "What is the name of Player 2? Type C if you wanna play with Computer"
    name2 = gets.chomp
    if name2 == 'C'
      @player2 = Computer.new('Computer')
    else 
      @player2 = Human.new(name2)
    end

    @players = [@player1, @player2]
  end

  def play
    until has_winner?
      @players.first.shoot(@players.last)
      display_grids_for(@players.first)
      @players.rotate!
    end    
    finish
  end

  def game_winner
    @players.find { |player| player.score == Player::MAX_SCORE }
  end
  
  alias :has_winner? :game_winner

  def finish
    puts "Congrads, #{game_winner.name}!!!"
  end

  def display_grids_for(player)
    puts player.name.green
    puts "Your Grid"
    player.grid.draw_board
    puts "Your opponent's grid \n"
    player.opponent_grid.draw_board
  end
end