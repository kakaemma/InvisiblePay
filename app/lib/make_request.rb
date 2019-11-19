require 'net/http'

module MakeRequest
  def exchange_rate(source, target)
    uri_part_one = "#{(ENV['URL'])}&access_key=#{(ENV['access_key'])}"
    uri_part_two = "&source=#{source}&currencies=#{target}"
    uri = URI.parse("#{uri_part_one}#{uri_part_two}")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end
end
