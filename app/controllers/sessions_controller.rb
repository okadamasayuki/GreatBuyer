class SessionsController < ApplicationController
    before_action :should_not_login,     only: [:new, :create]
    before_action :should_already_login, only: [:destroy]

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = 'ログインしました'
            redirect_to root_path
        else
            flash.now[:danger] = 'メールアドレスとパスワードが一致しません'
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        @current_user = nil
        flash[:success] = 'ログアウトしました'
        redirect_to root_path
    end

end
