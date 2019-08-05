require "game_of_life_dtz/version"
require 'game_of_life_dtz/board'

module GameOfLifeDtz
  #class Error < StandardError; end
  # Your code goes here...

  class GameOfLifeDtz
    attr_reader :dimension, :seconds
    def initialize(dimension = 20, seconds = 0.5)
      @dimension = dimension
      @seconds = seconds
      validation(@dimension, @seconds)
    end
  
    def validation(dimension, seconds)
      if dimension.is_a?(String) || seconds.is_a?(String)
        puts '¡Invalid values, only numbers are allowed!'
      else
        start
      end
    end
  
    def start
      board = Board.new(@dimension)
      loop do
        system('clear')
        board.show
        board.search_neighbors
        sleep(@seconds)
      end
    end
  end
end

#game = GameOfLifeDtz::GameOfLifeDtz.new(30, 0.3)
