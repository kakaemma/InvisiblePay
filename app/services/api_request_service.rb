require 'net/http'

# Make API requests
class ApiRequestService
  include Utility
  attr_reader :request_params

  # Initialise ApiRequestService
  def initialize(*args)
    @request_params = args
  end

  # Determine method to execute depending on number of arguments
  def make_request
    return api_request(currency_url) unless request_params.length < 2

    api_request(vat_url)
  end

  private

  # Format exchange rate request URL
  def currency_url
    currency_url = "#{ENV['URL']}&access_key=#{ENV['access_key']}"
    "#{currency_url}&source=#{request_params[0]}&currencies=#{request_params[1]}"
  end

  # Format VAT request URL
  def vat_url
    vat_url = "#{ENV['VAT_URL']}&access_key=#{ENV['vat_access_key']}"
    "#{vat_url}&vat_number=#{request_params[0]}"
  end
end
