class UsersController < ApplicationController

  def create
    user = User.new(user_params)
      render json: user, status: :ok if user.save!
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
    params.permit(:email, :password, :name, :team_id)
  end
end

#imageはfirebase storageに保存