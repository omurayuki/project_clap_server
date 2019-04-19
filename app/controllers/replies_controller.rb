class RepliesController < ApplicationController
  before_action :authenticate_user
  before_action :set_comment

  def index
    replies = @comment.replies.order(created_at: :desc)
    render json: replies, status: :ok
  end

  def show
    reply = @comment.replies.find(params[:id])
    render json: reply, status: :ok
  end

  def create
    reply = @comment.replies.build(reply_params)
    reply.save
    render json: reply, status: :ok
  end

  def update
    reply = @comment.replies.find(params[:id])
    reply.update(reply_params)
    render json: reply, status: :ok
  end

  def destroy
    reply = @comment.replies.find(params[:id])
    reply.destroy
    render json: { message: 'delete success' }, status: :ok
  end

  private

  def reply_params
    params.permit(:reply)
  end

  def set_comment
    diary = current_user.diaries.find("5")
    @comment = diary.comments.find(params[:comment_id])
  end
end