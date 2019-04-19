class ApplicationController < ActionController::API
  rescue_from Exception, with: :rescue500
  rescue_from ActionController::RoutingError, with: :rescue404

  def authenticate_user
    User.authenticate(request.headers[:Authorization])
  end

  def render_json_failure(message)
    render json: { message: message }, status: :unprocessable_entity
  end

  def current_user
    @current_user ||= User.find_by(token: request.headers[:Authorization])
  end

  def raise_not_found
    e = ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
    rescue404(e)
  end

  private

  def rescue404(e)
    render json: { error: 'Not Found' }, status: :not_found
  end

  def rescue500(e)
    logger.error("[log] #{e}")
    render json: { error: 'Internal Server Error' }, status: :internal_server_error
  end
end