# Utility methods to be used in the classes
module Utility
  # Convert and return array with amount and status code
  def process_amount(amount_to_convert, rate)
    converted = (amount_to_convert.to_f * rate.to_f).round(2)
    amount = { amount: converted }
    [amount, :ok]
  end

  # Make request to the api
  def api_request(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  rescue StandardError
    { 'error' => { 'info' => ErrorMessages.connection_error } }
  end

  def source_target
    source_currency + target_currency
  end

  # Handle errors from received when getting exchange rate
  def error(error)
    error = { error: error }
    [error, :bad_request]
  end
end
