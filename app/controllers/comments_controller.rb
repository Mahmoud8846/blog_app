class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [ :update, :destroy]
  before_action :authorize_comment_owner!, only: [ :update, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to home_homepage_path, notice: 'Comment added successfully.'
    else
      redirect_to home_homepage_path, alert: 'Failed to add comment.'
    end
  end



  def update
    if @comment.update(comment_params)
      redirect_to home_homepage_path, notice: 'Comment updated successfully.'
    else
      redirect_to home_homepage_path, alert: 'Failed to update comment.'
    end
  end

  def destroy
    @comment.destroy
    redirect_to home_homepage_path, notice: 'Comment deleted successfully.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_comment_owner!
    redirect_to home_homepage_path, alert: 'You are not authorized to perform this action.' unless @comment.user == current_user
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
