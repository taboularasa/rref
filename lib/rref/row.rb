module Rref
  class Row
    def initialize(data)
      @data = data
    end

    def [](index)
      @data[index]
    end
  end
end
