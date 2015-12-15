require 'spec_helper'

describe Rref::Column do
  let(:subject) { Rref::Column.new([1, 2, 3])}

  describe '#==' do
    it 'returns true if two instances have the same data' do
      expect(subject == Rref::Column.new([1, 2, 3])).to eq(true)
    end
  end

  describe '#fully_reduced?' do
    it 'returns true if there is a single value of 1 and all other values 0' do
      subject = Rref::Column.new([0, 0, 1, 0])
      expect(subject.fully_reduced?).to eq(true)

      subject = Rref::Column.new([0, 1, 1, 0])
      expect(subject.fully_reduced?).to eq(false)
    end
  end

  describe '#value_position' do
    it 'returns the index of the first value of 1' do
      subject = Rref::Column.new([0, 0, 1, 0])
      expect(subject.value_position).to eq(2)
    end

    it 'returns an error if the row is not fully_reduced' do
      subject = Rref::Column.new([0, 4, 1, 0])
      expect { subject.value_position }.to raise_error(RuntimeError)
    end
  end

  describe '#length' do
    it "returns the length of it's data" do
      expect(subject.length).to eq(subject.data.length)
    end
  end
end
