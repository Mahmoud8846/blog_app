class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:update, :destroy]
  before_action :authorize_comment_owner!, only: [:update, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to home_homepage_path, notice: 'Comment added successfully.' }
        format.json { render json: { message: 'Comment added successfully.', comment: @comment }, status: :created }
      end
    else
      respond_to do |format|
        format.html { redirect_to home_homepage_path, alert: 'Failed to add comment.' }
        format.json { render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @comment.update(comment_params)
      respond_to do |format|
        format.html { redirect_to home_homepage_path, notice: 'Comment updated successfully.' }
        format.json { render json: { message: 'Comment updated successfully.', comment: @comment }, status: :ok }
      end
    else
      respond_to do |format|
        format.html { redirect_to home_homepage_path, alert: 'Failed to update comment.' }
        format.json { render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to home_homepage_path, notice: 'Comment deleted successfully.' }
      format.json { render json: { message: 'Comment deleted successfully.' }, status: :ok }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_comment_owner!
    unless @comment.user == current_user
      respond_to do |format|
        format.html { redirect_to home_homepage_path, alert: 'You are not authorized to perform this action.' }
        format.json { render json: { error: 'You are not authorized to perform this action.' }, status: :forbidden }
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
