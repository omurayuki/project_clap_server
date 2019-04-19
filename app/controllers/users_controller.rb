class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :update, :destroy]

  def index
    user = User.find(params[:id])
    user
    render json: user, status: :ok
  end

  def create
    user = User.new(user_params)
    user.save
    render json: user, status: :ok
  end

  def login
    user = User.find_by(email: params[:email])
    user&.authenticate(params[:password])
    render json: user, status: :ok
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user, status: :ok
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { message: 'delete success' }, status: :ok
  end

  private

  def user_params
    params.permit(:email, :password, :name, :team_id, position_ids: [])
  end
end

# imageはfirebase storageに保存
# positionをusertableに多対多の関係で登録したいが、actionメソッドにどうやって書けばいいのか