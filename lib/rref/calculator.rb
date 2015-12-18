module Rref
  class Calculator
    attr_accessor :matrix

    def initialize(coefficient_matrix)
      self.matrix = coefficient_matrix
    end

    def matrix_to_rref
      while matrix.remaining_cursor_movements? do
        matrix.reduce_current_row
        matrix.zero_out_remaining_column
        matrix.advance_cursor
      end
      matrix.reduce_current_row
      matrix.zero_out_remaining_column
    end
  end
end
