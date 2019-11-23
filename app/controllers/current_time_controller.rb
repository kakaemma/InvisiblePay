# app/controllers/current_time_controller.rb

# Current time controller
class CurrentTimeController < ApplicationController
  include CurrentTimeControllerHelper
  # get current time and return json
  def index
    json_response(current_time)
  end
end
