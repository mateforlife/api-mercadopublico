class ApplicationController < ActionController::Base

  private

  def json_response(data)
    JSON.parse(JSON[data], symbolize_names: true)
  end
end
