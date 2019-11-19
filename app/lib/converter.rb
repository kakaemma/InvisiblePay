class Converter
  include ActiveModel::Validations
  include MakeRequest
  include Response

  attr_reader :amount, :source_currency, :target_currency
  validates :amount, presence: true, numericality: true
  validates :source_currency, presence: true
  validates :target_currency, presence: true

  def initialize(amount, source_currency, target_currency)
    @amount = amount
    @source_currency = source_currency
    @target_currency = target_currency
  end

  # Get exchange rate and start converting the amount
  def start_converting
    request_rate = conversion_rate
    error = request_rate['error']['info'] if request_rate['error']
    return error_in_request(error) unless request_rate['success']

    rate = request_rate['quotes'][source_currency + target_currency]
    process_amount(amount, rate)
  end

  private

  # Get current exchange rate
  def conversion_rate
    exchange_rate(source_currency, target_currency)
  end

  # Handle errors from received when getting exchange rate
  def error_in_request(error)
    error = { error: error }
    [error, :bad_request]
  end

  # Convert and return array with amount and status code
  def process_amount(amount_to_convert, rate)
    converted = amount_to_convert.to_i * rate.to_i
    amount = { amount: converted }
    [amount, :ok]
  end
end