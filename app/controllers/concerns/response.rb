# Format resppnse to json with status code
module Response
  # helper method to render json
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
