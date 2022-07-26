class UsersController < ApplicationController
    before_action :require_current_user!, except: [:create, :new]

    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to user_path(@user)
        else
            render json: @user.errors.full_messages
        end
    end

    def new 
        @user = User.new
        render :new
    end

    def show
        @user = User.find_by(id: params[:id])
        render json: @user
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end


    private

    def user_params
        self.params.require(:user).permit(:username, :password)
    end


end
