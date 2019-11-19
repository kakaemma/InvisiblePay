# app/controllers/currencies_controller.rb

class CurrenciesController < ApplicationController

  api :POST, '/api/currency/convert', 'Convert currencies'
  error :code => 400, :desc => :bad_request, :meta=>{'error':Message.invalid_params}
  error :code => 400, :desc => :bad_request, :meta =>{'error':Message.invalid_currency}
  param :amount, String, :desc => 'amount to be converted'
  param :source_currency, String, :desc => 'Source currency code (USD)'
  param :target_currency, String, :desc => 'Target currency code (CAD)'
  returns :code => 200, :desc => 'a successful response' do
    property :amount, Hash, :desc => '{amount : converted_amount}'
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
