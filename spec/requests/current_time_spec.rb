RSpec.describe CurrentTimeController, type: :request do
  describe 'GET /api/time/now' do
    before { get '/api/time/now' }

    it 'should return the current time' do
      expect(response).to have_http_status(200)
    end

    it 'should return current time' do
      expect(response.body).to match(/current_time/)
    end
  end
end
