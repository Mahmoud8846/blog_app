class HomeController < ApplicationController
    before_action :authenticate_user!
  
    def homepage
       @post = Post.new
       @posts = Post.all.order(created_at: :desc)
       @editing_post_id = params[:editing_post_id].to_i if params[:editing_post_id].present?
       @editing_comment_id = params[:editing_comment_id].to_i if params[:editing_comment_id]

    end
    def login
    end
    def profile
      @post = Post.new
      @posts = current_user.posts.order(created_at: :desc)
    end
  
    private
  
    def authenticate_user!
      unless current_user
        redirect_to login_path, alert: 'You need to log in to access this page.'
      end
    end
  end
  