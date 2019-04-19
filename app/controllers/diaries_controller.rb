class DiariesController < ApplicationController
  before_action :authenticate_user

  def show
    diary = Diary.find(params[:id])
    diary
    render json: diary, status: :ok
  end

  def index
    #statusをみてjsonで返す
    @diaries = Diary.all
    @diaries
    render json: @diaries, status: :ok
  end

  def create
    diary = Diary.create(diary_params)
    diary.user_id = current_user.id
    diary.save
    render json: diary, status: :ok
  end

  def find_item

  end

  def update
    diary = Diary.find(params[:id])
    diary.update(diary_params)
    render json: diary, status: :ok
  end

  def destroy
    diary = Diary.find(params[:id])
    diary.destroy
    render json: { message: 'delete success' }, status: :ok
  end

  private

  def diary_params
    params.permit(:text_1, :text_2, :text_3, :text_4, :text_5, :text_6, :status)
  end
end