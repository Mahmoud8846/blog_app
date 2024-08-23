class HomeController < ApplicationController
    before_action :authenticate_user!
  
    def homepage
      # Fetch all posts to display on the homepage
    #   @posts = Post.all.order(created_at: :desc)
    end
  
    def profile
      # Fetch only the posts of the currently logged-in user
    #   @posts = current_user.posts.order(created_at: :desc)
    end
  
    private
  
    def authenticate_user!
      unless current_user
        redirect_to login_path, alert: 'You need to log in to access this page.'
      end
    end
  end
  