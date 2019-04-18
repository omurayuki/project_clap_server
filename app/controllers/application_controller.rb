class ApplicationController < ActionController::API
  rescue_from Exception, with: :rescue500
  rescue_from ActionController::RoutingError, with: :rescue404
  
  def render_json_failure(message)
    render json: { message: message }, status: :unprocessable_entity
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