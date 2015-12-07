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
end
