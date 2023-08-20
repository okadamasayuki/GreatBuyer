class SessionsController < ApplicationController
    before_action :should_not_login,     only: [:new, :create]
    before_action :should_already_login, only: [:destroy]

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: 'You have logged in successfully!'
        else
            flash.now[:alert] = 'Email or Password is invalid'
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        @current_user = nil
        redirect_to root_path, notice: 'You have logged out successfully!'
    end

end
