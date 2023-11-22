module LoginSupport
    def logged_in?
        !session[:user_id].nil?
    end

    module System
        def log_in(user)
            visit login_path
            fill_in 'メールアドレス', with: user.email
            fill_in 'パスワード',    with: user.password
            click_button 'ログイン'
        end
    end
    
    module Request
        def log_in(user)
            post login_path, params: { session: { email: user.email,
                                                  password: user.password } }
        end
    end
end

RSpec.configure do |config|
    config.include LoginSupport
end