module Rref
  class CoefficientMatrix
    Cursor = Struct.new(:x, :y)
    attr_reader :rows, :cursor

    def initialize(data)
      @cursor = Rref::CoefficientMatrix::Cursor.new(0,0)
      @rows = data.map {|r| Rref::Row.new(r) }
    end

    def column(index)
      Rref::Column.new rows.map { |r| r[index] }
    end

    def row(index)
      rows[index]
    end

    def swap_rows(i, j)
      rows[i], rows[j] = rows[j], rows[i]
    end

    def cursor_value
      rows[cursor.y][cursor.x]
    end

    def remaining_cursor_movements?
      return false if cursor.x >= current_row.length - 1
      return false if cursor.y >= current_column.length - 1
      return false unless remaining_cursor_values?
      true
    end

    def remaining_cursor_values?
      remaining_rows.flat_map { |r| r.data[cursor.x..-1] }.reduce(&:+) != 0
    end

    def advance_cursor
      cursor.x += 1
      cursor.y += 1
    end

    def current_row
      row(cursor.y)
    end

    def other_rows
      rows.select {|r| r != current_row }
    end

    def remaining_rows
      rows[cursor.y + 1..-1]
    end

    def current_column
      column(cursor.x)
    end

    def reduce_current_row
      current_row.reduce_row_by_leading_coefficient
    end

    def zero_out_remaining_column
      other_rows.map do |row|
        row.add! current_row.multiply(row[cursor.y] * -1)
      end
    end

    def ==(other)
      rows == other.rows
    end

    def to_s
      rows.map {|r| puts "#{r.data}\n"}
    end
  end
end
