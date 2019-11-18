module RequestSpecHelper
  def json
    JSON.parser(response.body)
  end
end
