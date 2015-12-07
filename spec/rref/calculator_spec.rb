require 'spec_helper'

describe Rref::Calculator do
  let(:subject) { Rref::Calculator.new([[1,2,3],[3,2,1]]) }

  describe '#rows' do
    it 'returns a RrefRow for each element of the matrix' do
      expect(subject.rows.length > 1).to eq(true)
      expect(subject.rows.all? { |r| r.is_a? Rref::Row }).to eq(true)
    end
  end
end
