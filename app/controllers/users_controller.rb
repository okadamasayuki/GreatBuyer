class UsersController < ApplicationController
    before_action :should_not_login,     only: [:new, :create]

    def new
        @new_user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to root_path, notice: 'You have logged in successfully!'
        else
            render :new
        end
    end

    private

        def user_params
            params.require(:user).permit(:email, :password, :password_confirmation)
        end
end
