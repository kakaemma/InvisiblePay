Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/api/currency/convert' => 'currencies#convert_currency'
  post '/api/currency/vat' => 'currencies#validate_vat'
  get '/api/time/now' => 'current_time#index'
end
