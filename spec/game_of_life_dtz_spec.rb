=begin
RSpec.describe Cell do
  it "has a version number" do
    expect(GameOfLifeDtz::VERSION).not_to be nil
  end
end
=end


RSpec.describe Cell do
  describe '#count_neighbors_above_below' do
    context 'When the cell has two neighbors above' do
      it 'respond with the number 2' do
        cel = Cell.new
        board = [[0, 1, 1, 1, 0], [0, 0, 0, 1, 1], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]
        number_of_neighbors = cel.count_neighbors_above_below(board, 1, 3)
        expect(number_of_neighbors).to be(2)
      end
    end
    context 'When the cell has three neighbors below' do
      it 'respond with the number 3' do
        cel = Cell.new
        board = [[0, 0, 0, 0, 0], [0, 0, 1, 1, 1], [0, 0, 1, 1, 1], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]
        number_of_neighbors = cel.count_neighbors_above_below(board, 1, 3)
        expect(number_of_neighbors).to be(3)
      end
    end
    context 'When the cell has one neighbor above and two below' do
      it 'respond with the number 3' do
        cel = Cell.new
        board = [[0, 0, 0, 0, 1], [0, 0, 1, 1, 1], [0, 0, 1, 0, 1], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]
        number_of_neighbors = cel.count_neighbors_above_below(board, 1, 3)
        expect(number_of_neighbors).to be(3)
      end
    end
  end

  describe '#count_neighbors_left_right' do
    context 'When the cell has one neighbor on the left and right' do
      it 'respond with the number 1' do
        cel = Cell.new
        board = [[0, 0, 0, 1, 1], [0, 0, 1, 1, 1], [0, 0, 1, 0, 1], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]
        number_of_neighbors = cel.count_neighbors_left_right(board, 0, 3)
        expect(number_of_neighbors).to be(1)
      end
    end
    context 'When the cell has two neighbors on the left and right' do
      it 'respond with the number 2' do
        cel = Cell.new
        board = [[0, 0, 1, 1, 1], [0, 0, 1, 1, 1], [0, 0, 1, 0, 1], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]
        number_of_neighbors = cel.count_neighbors_left_right(board, 0, 3)
        expect(number_of_neighbors).to be(2)
      end
    end
    context 'When the cell has zero neighbors on the left and right' do
      it 'respond with the number 0' do
        cel = Cell.new
        board = [[0, 0, 0, 1, 0], [0, 0, 1, 1, 1], [0, 0, 1, 0, 1], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]
        number_of_neighbors = cel.count_neighbors_left_right(board, 0, 3)
        expect(number_of_neighbors).to be(0)
      end
    end
  end

  context 'When the cell has three neighbors around it' do
    it 'respond with the number 3' do
      cel = Cell.new
      number_of_neighbors = 0
      board = [[0, 0, 0, 1, 1], [0, 0, 1, 0, 1], [0, 0, 1, 0, 1], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]
      number_of_neighbors += cel.count_neighbors_above_below(board, 0, 3)
      number_of_neighbors += cel.count_neighbors_left_right(board, 0, 3)
      expect(number_of_neighbors).to be(3)
    end
  end
end
