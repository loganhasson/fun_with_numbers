require 'rails_helper'

describe SequenceTermsController do
  describe 'GET show' do
    context 'when sequence_name is invalid' do
      it 'returns a 422 status code' do
        get :show, sequence_name: 'tomatoface', n: '15'
        expect(response.status).to eq(422)
      end
    end

    context 'when sequence_name is valid' do
      context 'when n is invalid' do
        context 'when n is not an integer' do
          it 'returns a 422 status code' do
            get :show, sequence_name: 'fibonacci', n: 'tomatoface'
            expect(response.status).to eq(422)
          end
        end

        context 'when n is less than zero' do
          it 'returns a 422 status code' do
            get :show, sequence_name: 'fibonacci', n: '-1'
            expect(response.status).to eq(422)
          end
        end
      end

      context 'when n is valid' do
        it 'returns a 200 status code' do
          get :show, sequence_name: 'fibonacci', n: '1'
          expect(response.status).to eq(200)
        end

        it 'returns the nth term' do
          get :show, sequence_name: 'fibonacci', n: '5'
          expect(JSON.parse(response.body)['sequence']['nth_term']).to be_a(Integer)
        end
      end
    end
  end
end
