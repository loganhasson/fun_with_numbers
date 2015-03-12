require 'rails_helper'

describe Sequence::Happy do
  describe '#initialize' do
    it 'sets an instance variable equal to n' do
      sequence = Sequence::Happy.new(10)
      expect(sequence.n).to eq(10)
    end
  end

  describe '#sequence' do
    context 'when n is 0' do
      it 'returns an array with 1 as the only element' do
        sequence = Sequence::Happy.new(0)
        expect(sequence.sequence).to eq([1])
      end
    end

    context 'when n is less than 0' do
      it 'raises an error' do
        sequence = Sequence::Happy.new(-1)
        expect{sequence.sequence}.to raise_error('n must be greater than or equal to zero')
      end
    end

    context 'when n is greater than 0' do
      it 'returns the correct sequence' do
        sequence = Sequence::Happy.new(7)
        expect(sequence.sequence).to eq([1, 7, 10, 13, 19, 23, 28, 31])
      end
    end
  end
end
