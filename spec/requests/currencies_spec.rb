require 'rails_helper'


RSpec.describe 'Currency converter api', type: :request do
  describe 'POST /api/currency/convert'  do

    it 'should return status code 200' do
      expect(response).to have_http_status(200)
    end

  end
end
