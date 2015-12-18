require 'spec_helper'

describe Rref::Calculator do
  let(:coefficient_matrix) do
    Rref::CoefficientMatrix.new([
      [1, 1, 1, -1],
      [1, 2, 4, 3]
    ])
  end

  let(:subject) { Rref::Calculator.new(coefficient_matrix) }

  describe '#matrix_to_rref' do
    it "converts a coefficient_matrix to it's reduced row echelon form" do
      expected =
        Rref::CoefficientMatrix.new([
          [1, 0, -2, -5],
          [0, 1, 3, 4]
        ])
      subject.matrix_to_rref
      expect(subject.matrix).to eq(expected)
    end
  end
end
