class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :update, :destroy]

  def index
    @user = User.find(params[:id])
    if @user
      render json: @user, status: :ok
    else
      render_json_failure("can't fetch user")
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :ok
    else
      render_json_failure("can't create")
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: user, status: :ok
    else
      render_json_failure("can't login")
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user, status: :ok
    else
      render_json_failure("can't update")
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: { message: 'delete success' }, status: :ok
    else
      render_json_failure("can't delete")
    end
  end

  private

  def user_params
    params.permit(:email, :password, :name, :team_id, position_ids: [])
  end
end

# imageはfirebase storageに保存
# positionをusertableに多対多の関係で登録したいが、actionメソッドにどうやって書けばいいのか