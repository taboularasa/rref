require 'spec_helper'

describe Rref::CoefficientMatrix do
  let(:subject) { Rref::CoefficientMatrix.new([[1,2,3], [3,2,1]]) }

  describe '#rows' do
    it 'returns a RrefRow for each row of the matrix' do
      expect(subject.rows.length > 1).to eq(true)
      expect(subject.rows.all? { |r| r.is_a? Rref::Row }).to eq(true)
    end
  end

  describe '#column' do
    it 'returns the nth element from each row' do
      expect(subject.column(0)).to eq(Rref::Column.new([1,3]))
    end
  end

  describe '#row' do
    it 'is an alias for #rows subscript operator' do
      expect(subject.row(0)).to eq(subject.rows[0])
    end
  end

  describe '#swap_rows' do
    it 'swaps two rows defined by their index' do
      original_row_positions = subject.rows.dup

      subject.swap_rows(0, 1)

      expect(subject.rows)
        .to eq([original_row_positions[1], original_row_positions[0]])
    end
  end

  describe '#cursor_value' do
    it 'returns the value of the cell under the cursor' do
      cursor = double('Rref::Cursor', x: 0, y: 1)
      allow(subject).to receive(:cursor) { cursor }

      expect(subject.cursor_value).to eq(3)
    end
  end

  describe '#advance_cursor' do
    it 'increments the cursor.x and cursor.y by 1' do
      starting_x = subject.cursor.x
      starting_y = subject.cursor.y

      subject.advance_cursor

      expect(subject.cursor.x).to eq(starting_x + 1)
      expect(subject.cursor.y).to eq(starting_y + 1)
    end
  end

  describe '#current_row' do
    it 'returns the row currently under the cursor y axis' do
      cursor = double('Rref::Cursor', x: 0, y: 1)
      allow(subject).to receive(:cursor) { cursor }

      expect(subject.current_row).to eq(subject.rows[1])
    end
  end

  describe '#other_rows' do
    it 'returns rows other than the current_row' do
      expect(subject.other_rows.include? subject.current_row).to eq(false)
    end
  end

  describe '#current_column' do
    it 'returns the column currently under the cursor x axis' do
      cursor = double('Rref::Cursor', x: 1, y: 0)
      allow(subject).to receive(:cursor) { cursor }

      expect(subject.current_column).to eq(subject.column(1))
    end
  end

  describe '#reduce_current_row' do
    let(:row_1) { subject.row(0) }
    let(:row_2) { subject.row(1) }

    it 'sends reduce_row_by_leading_coefficient to the current row' do
      expect(row_1)
        .to receive(:reduce_row_by_leading_coefficient).and_call_original

      subject.reduce_current_row

      subject.advance_cursor

      expect(row_2)
        .to receive(:reduce_row_by_leading_coefficient).and_call_original

      subject.reduce_current_row
    end
  end

  describe '#zero_out_remaining_column' do
    it 'add current_row to all other rows scaled by inverse of leading valule' do
      subject = Rref::CoefficientMatrix.new([[1,4,6], [2,4,3], [4,3,1]])
      subject.zero_out_remaining_column

      expect(subject.current_column.fully_reduced?).to eq(true)
      expect(subject.current_column.value_position)
        .to eq(subject.cursor.y)
    end
  end
end
