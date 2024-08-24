class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user!, only: [:edit, :update, :destroy]
  
    def index
      @posts = Post.all.order(created_at: :desc)
    end
  
    def show
      @comment = Comment.new
    end
  
    def new
      @post = Post.new
    end
  
    def profile
        @posts = current_user.posts.order(created_at: :desc)
      end

    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        process_tags(@post)
        redirect_to home_homepage_path, notice: 'Post was successfully created.'
      else
        @posts = Post.all.order(created_at: :desc)
        render 'home/homepage'
      end
    end
  
    def edit
    end

    def process_tags(post)
  new_tag_names = params[:post][:tag_list].split(',').map(&:strip).reject(&:empty?)

  current_tags = post.tags.pluck(:name)

  tags_to_remove = current_tags - new_tag_names
  tags_to_add = new_tag_names - current_tags

  tags_to_remove.each do |tag_name|
    tag = Tag.find_by(name: tag_name)
    post.tags.delete(tag) if tag
  end

  tags_to_add.each do |tag_name|
    tag = Tag.find_or_create_by(name: tag_name)
    post.tags << tag unless post.tags.include?(tag)
  end
end

    def update
      if @post.update(post_params)
        process_tags(@post)
        redirect_to home_homepage_path, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @post.destroy
      redirect_to home_homepage_path, notice: 'Post was successfully deleted.'
    end
  
    private
    
    def authenticate_user!
        unless current_user
          redirect_to login_path, alert: 'You need to log in to access this page.'
        end
      end
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :body, tag_ids: [])
    end
  
    def authorize_user!
      redirect_to posts_path, alert: 'You are not authorized to perform this action.' unless @post.user == current_user
    end
  end
  