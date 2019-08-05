require 'game_of_life_dtz/cell'

class Board
  attr_accessor :board_copy
  attr_reader :dimension, :board
  def initialize(dimension)
    @dimension = dimension
    create_board(@dimension)
  end

  def create_board(dimension)
    @board = []
    dimension.times do
      @board << Array.new(dimension, 0)
    end
    @board.each do |row|
      row.map! do |column|
        column = rand(2)
      end
    end
  end

  def show
    @board.each do |row|
      row.each do |column|
        print column == 1 ? '@ ' : '. '
      end
      puts ' '
    end
    puts ' '
  end

  def new_generation(number_of_neighbors, index_row, index_column)
    if number_of_neighbors < 2 || number_of_neighbors > 3
      @board_copy[index_row][index_column] = 0
    elsif number_of_neighbors == 3
      @board_copy[index_row][index_column] = 1
    end
  end

  def search_neighbors
    @board_copy = []
    @board_copy = Marshal.load(Marshal.dump(@board))

    @board.each_with_index do |row, index_row|
      row.each_index do |index_column|
        number_of_neighbors = 0
        cell = Cell.new
        number_of_neighbors += cell.count_neighbors_above_below(@board, index_row, index_column)
        number_of_neighbors += cell.count_neighbors_left_right(@board, index_row, index_column)
        new_generation(number_of_neighbors, index_row, index_column)
      end
    end

    @board = Marshal.load(Marshal.dump(@board_copy))
  end
end