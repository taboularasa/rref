module Rref
  class CoefficientMatrix
    attr_reader :rows

    def initialize(data)
      @rows = data.map {|r| Rref::Row.new(r) }
    end

    def column(index)
      Rref::Column.new rows.map { |r| r[index] }
    end

    def swap_rows(i, j)
      rows[i], rows[j] = rows[j], rows[i]
    end

    def cursor_value
      
    end
  end
end
