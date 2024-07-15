class ApplicationController < ActionController::API
  def up
    render head: :ok, content_type: "text/html"
  end
end
