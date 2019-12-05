module CurrentTimeHelper
  def current_time
    time = Time.now.strftime('%I:%M:%S %Z %z')
    { current_time: time }
  end
end
