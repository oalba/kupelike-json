class ErrorsController < ApplicationController
  def access_denied
    render(status: 403)
  end

  def not_found
    render(status: 404)
  end

  def internal_server_error
    render(status: 500)
  end
end
