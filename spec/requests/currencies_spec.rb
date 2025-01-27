require 'rails_helper'

RSpec.describe CurrenciesController, type: :request do
  describe 'POST /api/currency/convert' do
    context 'when the data is valid' do
      let(:env) do
        { 'URL' => 'URL' }
      end
      let(:valid_params) do
        {
          amount: '500', source_currency: 'USD',
          target_currency: 'EUR'
        }
      end
      before do
        stub_const('ENV', env)
        post '/api/currency/convert', params: valid_params
      end
      it 'should return status code 400' do
        expect(response).to have_http_status(400)
      end
      it 'should return a connection error message' do
        expect(response.body).to match(/Connection error/)
      end
    end
    context 'when the data is valid' do
      let(:valid_params) do
        {
          amount: '500', source_currency: 'USD',
          target_currency: 'EUR'
        }
      end
      before { post '/api/currency/convert', params: valid_params }
      it 'should return data that was converted' do
        expect(json).not_to be_empty
      end

      it 'should return status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'should covert the currency and return amount' do
        expect(response.body).not_to be_empty
      end
    end
    context 'when the data is not valid' do
      let(:invalid_params) {}
      before { post '/api/currency/convert', params: invalid_params }
      it 'should return status code 404' do
        expect(response).to have_http_status(400)
      end
      it 'should return an error message' do
        expect(response.body).to match(/Invalid parameters submitted/)
      end
    end
    context 'when the amount  is not a number' do
      let(:invalid_amount) do
        {
          amount: 'Amount', source_currency: 'USD',
          target_currency: 'EUR'
        }
      end
      before { post '/api/currency/convert', params: invalid_amount }
      it 'should return status code 404' do
        expect(response).to have_http_status(400)
      end
      it 'should return an error message' do
        expect(response.body).to match(/Invalid parameters submitted/)
      end
    end
    context 'when the source currency is wrong' do
      let(:invalid_source_currency) do
        {
          amount: '500', source_currency: 'USDG',
          target_currency: 'EUR'
        }
      end
      before { post '/api/currency/convert', params: invalid_source_currency }

      it 'should return status code 404' do
        expect(response).to have_http_status(400)
      end
      it 'should return an error message' do
        expect(response.body).to match(/You have supplied an invalid Source Currency/)
      end
    end
    context 'when the target currency is wrong' do
      let(:invalid_source_currency) do
        {
          amount: '500', source_currency: 'USD',
          target_currency: 'EURZ'
        }
      end
      before { post '/api/currency/convert', params: invalid_source_currency }

      it 'should return status code 404' do
        expect(response).to have_http_status(400)
      end
      it 'should return an error message' do
        expect(response.body).to match(/You have provided one or more invalid Currency Codes/)
      end
    end
  end

  describe 'POST /api/currency/vat' do
    context 'when the VAT number is invalid' do
      let(:invalid_vat) { { vat_number: 'ATU668892' } }
      before { post '/api/currency/vat', params: invalid_vat }
      it 'should return status code 400' do
        expect(response).to have_http_status(400)
      end

      it 'should return return an error message ' do
        expect(response.body).to match(/Invalid VAT number/)
      end
    end
    context 'when the VAT number is valid' do
      let(:valid_vat) { { vat_number: 'ATU66889218' } }
      before { post '/api/currency/vat', params: valid_vat }
      it 'should return status code 400' do
        expect(response).to have_http_status(200)
      end

      it 'should return return an error message ' do
        expect(response.body).to match(/country_code/)
      end
    end
  end
end
