module Rref
  class CoefficientMatrix
    attr_reader :rows

    def initialize(data)
      @rows = data.map {|r| Rref::Row.new(r) }
    end

    def column(index)
      Rref::Column.new rows.map { |r| r[index] }
    end
  end
end
