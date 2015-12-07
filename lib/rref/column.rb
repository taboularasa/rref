module Rref
  class Column
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def ==(other)
      data == other.data
    end
  end
end
