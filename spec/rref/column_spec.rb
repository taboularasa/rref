require 'spec_helper'

describe Rref::Column do
  let(:subject) { Rref::Column.new([1,2,3])}
  describe '#==' do
    it 'returns true if two instances have the same data' do
      expect(subject == Rref::Column.new([1,2,3])).to eq(true)
    end
  end
end
