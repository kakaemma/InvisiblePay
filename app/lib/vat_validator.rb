class VatValidator
  include ActiveModel::Validations
  include MakeRequest

  attr_reader :vat_number
  validates :vat_number, presence: true

  def initialize(vat_number)
    @vat_number = vat_number
  end

  def validate_vat_number
    vat = vat_validation_request(vat_number)
    return error_in_request(Message.invalid_vat) unless vat['valid']

    code = { country_code: vat['country_code'] }
    [code, :ok]
  end
end
