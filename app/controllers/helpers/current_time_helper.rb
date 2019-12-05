module CurrentTimeHelper
  def current_time
    time = Time.now
    { current_time: time }
  end
end
