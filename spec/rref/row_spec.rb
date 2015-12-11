require 'spec_helper'

describe Rref::Row do
  describe '#any_non_zero_values?' do
    it 'returns true if there is any nonzero value in the row' do
      subject = Rref::Row.new([0,0,1])
      expect(subject.any_non_zero_values?).to eq(true)
    end

    it 'returns false if all values in the row are zero' do
      subject = Rref::Row.new([0,0,0])
      expect(subject.any_non_zero_values?).to eq(false)
    end
  end

  describe '#leading_coefficient' do
    it 'returns the left-most nonzero entry' do
      subject = Rref::Row.new([0,4,1])
      expect(subject.leading_coefficient).to eq(4)
    end
  end
end
