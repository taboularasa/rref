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

  describe '#swap_rows' do
    it 'swaps two rows defined by their index' do
      original_row_positions = subject.rows.dup

      subject.swap_rows(0, 1)

      expect(subject.rows)
        .to eq([original_row_positions[1], original_row_positions[0]])
    end
  end

  describe '#multiply_row' do
    it 'multiplies a row by a nonzero scalar value'
    it 'raises argument error for zero value'
    it 'returns a new row'
  end

  describe '#multiply_row!' do
    it 'same as #multiply_row but assigns the value in place'
  end

  describe '#add_scaled_other_row' do
    it 'adds another row that has been multiplied by a scalar'
  end

  describe '#cursor_value' do
    it 'returns the value of the cell under the cursor' do
      cursor = double('Rref::Cursor', x: 0, y: 1)
      allow(subject).to receive(:cursor) { cursor }

      expect(subject.cursor_value).to eq(3)
    end
  end
end
