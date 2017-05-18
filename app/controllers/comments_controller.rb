class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    @comment.message = params[:message]
    @comment.article_id = params[:article_id]
    @comment.user_id = params[:user_id]
    @comment.save
    redirect_to :back
  end
end
