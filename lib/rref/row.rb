module Rref
  class Row
    def initialize(data)
      @data = data
    end

    def [](index)
      @data[index]
    end

    def any_non_zero_values?
      @data.any? {|i| i > 0}
    end
  end
end
