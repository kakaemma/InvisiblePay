# app/controllers/currencies_controller.rb

class CurrenciesController < ApplicationController
  # Receive request and start converting the currency
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
