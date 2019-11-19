require 'net/http'

module MakeRequest
  def exchange_rate(source, target)
    uri_and_key = format_url(ENV['URL'], ENV['access_key'])
    src_and_target = "&source=#{source}&currencies=#{target}"
    uri = URI.parse("#{uri_and_key}#{src_and_target}")
    response = Net::HTTP.get_response(uri)
    format_response(response)
  end

  def vat_validation_request(vat_number)
    vat_uri = format_url(ENV['VAT_URL'], ENV['vat_access_key'])
    vat_num = "&vat_number=#{vat_number}"
    uri = URI.parse("#{vat_uri}#{vat_num}")
    response = Net::HTTP.get_response(uri)
    format_response(response)
  end

  def format_url(uri, access_key)
    "#{uri}&access_key=#{access_key}"
  end

  def format_response(resp)
    JSON.parse(resp.body)
  end

  # Handle errors from received when getting exchange rate
  def error_in_request(error)
    error = { error: error }
    [error, :bad_request]
  end
end
