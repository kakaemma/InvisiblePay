# app/controllers/currencies_controller.rb

# Receive currency and VAT
class CurrenciesController < ApplicationController
  include CurrenciesControllerHelper
  # include ConverterService
  def convert_currency
    converter = ConverterService.new(
      params[:amount], params[:source_currency],
      params[:target_currency]
    )
    return invalid_data_response unless converter.valid?

    result = Rails.cache.fetch(source_target) do
      converter.start_converting
    end
    json_response(result[0], result[1])
  end

  # validate vat and return Country code
  def validate_vat
    vat_validator = VatService.new(params[:vat_number])
    return invalid_data_response unless vat_validator.valid?

    vat_result = Rails.cache.fetch(params[:vat_number]) do
      vat_validator.validate_vat_number
    end
    json_response(vat_result[0], vat_result[1])
  end

  private

  # Return an invalid response if any parameter is not submitted
  def invalid_data_response
    json_response({
                    error: ErrorMessages.invalid_params
                  }, :bad_request)
  end
end
