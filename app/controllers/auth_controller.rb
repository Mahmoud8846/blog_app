require 'jwt'
class AuthController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:login, :create]

    def signup
      user = User.new(user_params)
      if user.save
        render json: { message: 'User created successfully', user: user }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end


    
    def login
        user = User.find_by(email: params[:email])
        
        if user && user.authenticate(params[:password])
          token = encode_token({ user_id: user.id }) 
          respond_to do |format|
            format.json { render json: { token: token, user: user }, status: :ok }
            format.html { redirect_to root_path, notice: 'Logged in successfully.' }
            
          end
        else
          respond_to do |format|
            format.html do
              flash.now[:alert] = 'Invalid email or password'
              render :login_page
            end
            format.json { render json: { errors: ['Invalid email or password'] }, status: :unauthorized }
          end
        end
      end
      

      def new
        @user = User.new
      end


      def create
        @user = User.new(user_params)
        
        if params[:user][:image].present?
          @user.image_url = params[:user][:image]
        end
        
        if @user.save
          respond_to do |format|
            format.html { redirect_to login_path, notice: 'User created successfully. Please log in.' }
            format.json { render json: { message: 'User created successfully', user: @user }, status: :created }
          end
        else
          respond_to do |format|
            format.html do
              flash.now[:alert] = @user.errors.full_messages.to_sentence
              render :new
            end
            format.json { render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity }
          end
        end
      end
      
      def login_page

      end


    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image_url)
    end
    def encode_token(payload)
        JWT.encode(payload, Rails.application.credentials.jwt_secret)
      end
      
      def decode_token(token)
        JWT.decode(token, Rails.application.credentials.jwt_secret, true, algorithm: 'HS256')[0]
      rescue JWT::DecodeError
        nil
      end
  end
  