# Get exchange rate and covert currency
class ConverterService
  include ActiveModel::Validations
  include Utility

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
    return error(request_rate['error']['info']) if request_rate['error']

    process_amount(amount, request_rate['quotes'][source_target])
  end

  private

  # Get current exchange rate
  def conversion_rate
    exchange_rate = ApiRequestService.new(source_currency, target_currency)
    exchange_rate.make_request
  end
end
