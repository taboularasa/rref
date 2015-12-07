module Rref
  class Calculator
    attr_accessor :coefficient_matrix

    def initialize(data)
      self.coefficient_matrix = Rref::CoefficientMatrix.new(data)
    end
  end
end
