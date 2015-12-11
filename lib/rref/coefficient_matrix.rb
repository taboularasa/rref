module Rref
  class CoefficientMatrix
    Cursor = Struct.new(:x, :y)
    attr_reader :rows

    def initialize(data)
      @cursor = Rref::CoefficientMatrix::Cursor.new(0,0)
      @rows = data.map {|r| Rref::Row.new(r) }
    end

    def column(index)
      Rref::Column.new rows.map { |r| r[index] }
    end

    def swap_rows(i, j)
      rows[i], rows[j] = rows[j], rows[i]
    end

    def cursor_value
      rows[cursor.y][cursor.x]
    end

    private

    def cursor
      @cursor
    end
  end
end
