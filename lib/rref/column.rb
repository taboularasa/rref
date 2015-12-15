module Rref
  class Column
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def ==(other)
      data == other.data
    end

    def fully_reduced?
      data.reduce(:+) == 1
    end

    def value_position
      raise RuntimeError unless fully_reduced?
      data.find_index(1)
    end
  end
end
