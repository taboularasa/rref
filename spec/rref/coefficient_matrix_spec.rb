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

  describe '#current_row' do
    it 'returns the row currently under the cursor y axis' do
      cursor = double('Rref::Cursor', x: 0, y: 1)
      allow(subject).to receive(:cursor) { cursor }

      expect(subject.current_row).to eq(subject.rows[1])
    end
  end

  describe '#current_column' do
    it 'returns the column currently under the cursor x axis' do
      cursor = double('Rref::Cursor', x: 1, y: 0)
      allow(subject).to receive(:cursor) { cursor }

      expect(subject.current_column).to eq(subject.column(1))
    end
  end
end
