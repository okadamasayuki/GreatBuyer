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

    def edit
        
    end

    def update 
        # binding.pry
        if current_user.update(user_params)
            redirect_to root_path
        else
            render :edit
        end
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
        end
end
