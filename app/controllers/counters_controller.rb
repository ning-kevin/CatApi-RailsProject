class CountersController < ApplicationController
    def update
        current_user.counter = params[:user][:user_id][:counter]
        current_user.save!
        redirect_to user_url(current_user)
    end
end