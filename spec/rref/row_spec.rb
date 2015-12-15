require 'spec_helper'

describe Rref::Row do
  describe '#any_non_zero_values?' do
    it 'returns true if there is any nonzero value in the row' do
      subject = Rref::Row.new([0, 0, 1])
      expect(subject.any_non_zero_values?).to eq(true)
    end

    it 'returns false if all values in the row are zero' do
      subject = Rref::Row.new([0, 0, 0])
      expect(subject.any_non_zero_values?).to eq(false)
    end
  end

  describe '#leading_coefficient' do
    it 'returns the left-most nonzero entry' do
      subject = Rref::Row.new([0, 4, 1])
      expect(subject.leading_coefficient).to eq(4)
    end
  end

  describe '#reduce_row_by_leading_coefficient' do
    it 'multiplies the row by the inverse of the leading coefficient' do
      subject = Rref::Row.new([0, 2, 4, 6])

      expect(subject.reduce_row_by_leading_coefficient)
        .to eq(Rref::Row.new([0, 1, 2, 3]))
    end
  end

  describe '#multiply' do
    let(:subject) { Rref::Row.new([1, 2, 3]) }

    it 'multiplies a row by a nonzero scalar value' do
      expect(subject.multiply(2)).to eq(Rref::Row.new([2, 4, 6]))
    end

    it 'raises argument error for zero value' do
      expect { subject.multiply(0) }.to raise_error(ArgumentError)
    end

    it 'returns a new row' do
      return_value = subject.multiply(2)
      expect(subject).to_not eq(return_value)
    end
  end

  describe '#multiply!' do
    let(:subject) { Rref::Row.new([1, 2, 3]) }

    it 'is the same as #multiply but assigns the value in place' do
      return_value = subject.multiply!(2)

      expect(subject).to eq(return_value)
      expect(subject).to eq(Rref::Row.new([2, 4, 6]))
    end
  end

  describe '#add' do
    let(:subject) { Rref::Row.new([1, 2, 3])}
    let(:other_row) { Rref::Row.new([3, 2, 1])}

    it 'sums row by another row' do
      expect(subject.add(other_row)).to eq(Rref::Row.new([4, 4, 4]))
    end

    it 'returns a new row' do
      return_value = subject.add(other_row)

      expect(subject).to_not eq(return_value)
    end

    it 'raises argument error unless Rref::Row is passed' do
      expect { subject.add('foo') }.to raise_error(ArgumentError)
    end
  end

  describe '#add!' do
    let(:subject) { Rref::Row.new([1, 2, 3])}
    let(:other_row) { Rref::Row.new([3, 2, 1])}

    it 'is the same as #add but assigns the value in place' do
      return_value = subject.add!(other_row)

      expect(subject).to eq(return_value)
      expect(subject).to eq(Rref::Row.new([4, 4, 4]))
    end
  end

  describe '#==' do
    it 'compares two rows by value instead of identity' do
      row_a = Rref::Row.new([1,2,3])
      row_b = Rref::Row.new([1,2,3])

      expect(row_a).to eq(row_b)
    end
  end

  describe '#fully_reduced?' do
    it 'returns true when the leading coefficient is 1' do
      subject = Rref::Row.new([0,1,0])
      expect(subject.fully_reduced?).to eq(true)

      subject = Rref::Row.new([0,2,1])
      expect(subject.fully_reduced?).to eq(false)
    end
  end

  describe '#length' do
    it "returns the length of it's data" do
      expect(subject.length).to eq(subject.data.length)
    end
  end
end
