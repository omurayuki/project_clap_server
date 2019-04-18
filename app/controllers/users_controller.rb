class UsersController < ApplicationController
  # has_secure_password

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :ok
    else
      render_json_failure("can't signup")
    end
  end

  def login
    current_user = User.find_by(email: users_params[:email], password: users_params[:password])
    return render json: {status: 401, message: '認証に失敗しました'} unless current_user
    render plain: current_user.token

  rescue StandardError => e
    Rails.logger.error(e.message)
    render json: Init.message(500, e.message), status: 500
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password_confirmation, :name, :teamId)
  end
end