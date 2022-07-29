class UsersController < ApplicationController
    before_action :require_current_user!, except: [:create, :new]

    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to user_path(@user)
        else
            # render json: @user.errors.full_messages
            flash.now[:error] = "User exists or password is less than 6 digits!"
            # redirect_to new_user_path
            render :new
        end
    end

    def new 
        @user = User.new
        render :new
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end


    private

    def user_params
        self.params.require(:user).permit(:username, :password)
    end


end
