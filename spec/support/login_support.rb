module LoginSupport
    module System
        def log_in(user)
            visit login_path
            fill_in 'メールアドレス', with: user.email
            fill_in 'パスワード',    with: user.password
            click_button 'ログインする！'
        end
    end
    
    module Request
        def log_in(user)
            post login_path, params: { session: { email: user.email,
                                                  password: user.password } }
        end
    end
end
