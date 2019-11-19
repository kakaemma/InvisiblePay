# app/controllers/currencies_controller.rb

class CurrenciesController < ApplicationController

  api :POST, '/api/currency/convert', 'Convert currencies'
  param :amount, String, :desc => 'amount to be converted', :required => true
  param :source_currency, String, :desc => 'Source currency', :required => true
  param :target_currency, String, :desc => 'Target currency', :required => true
  returns :code => 200, :desc => 'a successful response' do
    property :amount, String, :desc => 'Converted amount'
  end


  #Receive request and start converting the currency
  def convert_currency
    converter = Converter.new(
      params[:amount], params[:source_currency],
      params[:target_currency]
    )
    return invalid_data_response unless converter.valid?

    result = converter.start_converting
    json_response(result[0], result[1])
  end

  # Return an invalid response if any parameter is not submitted
  def invalid_data_response
    json_response({
                    error: Message.invalid_params
                  }, :bad_request)
  end
end
