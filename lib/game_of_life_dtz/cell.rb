class Cell
  def count_neighbors_above_below(board, index_row, index_column)
    above_position = -1
    below_position = 1
    neighbors_counter = 0

    if index_row + above_position >= 0
      if index_column > 0
        neighbors_counter += 1 if board[index_row - 1][index_column - 1] == 1
        neighbors_counter += 1 if board[index_row - 1][index_column] == 1
        neighbors_counter += 1 if board[index_row - 1][index_column + 1] == 1
      else
        neighbors_counter += 1 if board[index_row - 1][index_column] == 1
        neighbors_counter += 1 if board[index_row - 1][index_column + 1] == 1
      end
    end

    if index_row + below_position < board.length
      if index_column > 0
        neighbors_counter += 1 if board[index_row + 1][index_column - 1] == 1
        neighbors_counter += 1 if board[index_row + 1][index_column] == 1
        neighbors_counter += 1 if board[index_row + 1][index_column + 1] == 1
      else
        neighbors_counter += 1 if board[index_row + 1][index_column] == 1
        neighbors_counter += 1 if board[index_row + 1][index_column + 1] == 1
      end
    end
    neighbors_counter
  end

  def count_neighbors_left_right(board, index_row, index_column)
    left_position = -1
    right_position = 1
    neighbors_counter = 0

    if index_column + left_position >= 0
      neighbors_counter += 1 if board[index_row][index_column - 1] == 1
    end

    if index_column + right_position < board.length
      neighbors_counter += 1 if board[index_row][index_column + 1] == 1
    end
    neighbors_counter
  end
end