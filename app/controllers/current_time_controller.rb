class CurrentTimeController < ApplicationController
  include CurrentTimeHelper
  def index
    json_response(current_time)
  end
end
