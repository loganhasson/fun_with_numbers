require 'rails_helper'

describe Sequence::Fibonacci do
  describe '#initialize' do
    it 'sets an instance variable equal to n - 1' do
      sequence = Sequence::Fibonacci.new(10)
      expect(sequence.n).to eq(9)
    end
  end

  describe '#sequence' do
    context 'when n is 0' do
      it 'returns an array with 0 as the only element' do
        sequence = Sequence::Fibonacci.new(0)
        expect(sequence.sequence).to eq([0])
      end
    end

    context 'when n is less than 0' do
      it 'raises an error' do
        sequence = Sequence::Fibonacci.new(-1)
        expect{sequence.sequence}.to raise_error('n must be greater than or equal to zero')
      end
    end

    context 'when n is greater than 0' do
      it 'returns the correct sequence' do
        sequence = Sequence::Fibonacci.new(8)
        expect(sequence.sequence).to eq([0, 1, 1, 2, 3, 5, 8, 13, 21])
      end
    end
  end
end
