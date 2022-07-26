class SessionsController < ApplicationController
    def new
        render :new
    end

    def create 
        user = User.find_by_credentials(session_params)

        if user.nil?
            render json: "Credentials were wrong."
        else
            login!(user)
            # render json: "Welcome back #{user.username}!"
            redirect_to user_url(user)
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

    private

    def session_params
        self.params.require(:user).permit(:username, :password)
    end


end