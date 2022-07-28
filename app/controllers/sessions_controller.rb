class SessionsController < ApplicationController
    def new
        # @user = User.new
        render :new
    end

    def create 
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])

        if user.nil?
            # render json: "Credentials were wrong."
            flash.now[:error] = "Credentials were wrong."
            render :new
        else
            login!(user)
            # render json: "Welcome back #{user.username}!"
            redirect_to user_path(user)
        end
    end

    def destroy
        logout!
        redirect_to new_session_path
    end

    # private

    # def session_params
    #     self.params.require(:user).permit(:username, :password)
    # end


end