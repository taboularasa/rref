module Rref
  class Calculator
    attr_accessor :coefficient_matrix

    def initialize(coefficient_matrix)
      self.coefficient_matrix = coefficient_matrix
    end

    def rows
      @rows ||= coefficient_matrix.map {|r| Rref::Row.new(r) }
    end
  end
end
