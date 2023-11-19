class UsersController < ApplicationController
    before_action :should_not_login,     only: [:new, :create]
    before_action :should_already_login, only: [:edit, :update]

    def new
        @new_user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            flash[:success] = 'ログインしました'
            redirect_to root_path
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
