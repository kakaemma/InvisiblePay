# Validate VAT
class VatService
  include ActiveModel::Validations
  include Utility

  attr_reader :vat_number
  validates :vat_number, presence: true

  # Initialise VatService
  def initialize(vat_number)
    @vat_number = vat_number
  end

  # Make request to validate VAT number
  def validate_vat_number
    vat = ApiRequestService.new(vat_number)
    response = vat.make_request
    return error(response['error']['info']) if response['error']

    return error(ErrorMessages.invalid_vat) unless response['valid']

    code = { country_code: response['country_code'] }
    [code, :ok]
  end
end
