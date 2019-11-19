class Message
  def self.invalid_params
    'Invalid parameters submitted'
  end
  def self.invalid_currency
    'You have provided one or more invalid Currency Codes.[Required format: currencies=EUR,USD,GBP]'
  end
end
