module StaticPagesHelper
    def should_already_login
        # current_userに値が入っていれば、if文を通過して、
        # そのままアクセスできる
        if current_user.nil? 
            flash[:danger] = 'ログインしてください'
            redirect_to login_path
        end
    end

    def should_not_login
        unless  current_user.nil?
            redirect_to root_path
        end
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end
end
