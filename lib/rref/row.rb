module Rref
  class Row
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def [](index)
      data[index]
    end

    def any_non_zero_values?
      data.any? {|i| i > 0}
    end

    def leading_coefficient
      data.detect {|i| i > 0 }
    end

    def reduce_row_by_leading_coefficient
      multiply!(Rational(1,leading_coefficient))
    end

    def multiply(scalar)
      raise ArgumentError, 'scalar can not be zero' if scalar == 0
      self.class.new(data.map {|i| i * scalar})
    end

    def multiply!(scalar)
      @data = multiply(scalar).data
      self
    end

    def ==(other)
      data == other.data
    end
  end
end
