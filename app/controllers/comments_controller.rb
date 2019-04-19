class CommentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_diary

  def index
    @comments = @diary.comments.order(created_at: :desc)
    render json: @comments, status: :ok
  end

  def create
    comment = @diary.comments.build(comment_params)
    comment.save
    render json: comment, status: :ok
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    render json: comment, status: :ok
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: { message: 'delete success' }, status: :ok
  end

  private

  def comment_params
    params.permit(:comment)
  end

  def set_diary
    @diary = current_user.diaries.find(params[:diary_id])
  end
end