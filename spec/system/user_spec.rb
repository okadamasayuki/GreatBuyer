require "rails_helper"

RSpec.describe "Users", type: :system do

    describe 'new user' do
        before do
            visit new_user_path
        end

        it 'exists mail-address' do
            expect(page).to have_content 'メールアドレス'
        end

        it 'exists password' do
            expect(page).to have_content 'パスワード'
        end

        it 'exists password confirm' do
            expect(page).to have_content 'パスワード（確認）'
        end

        it 'exists new user button' do
            expect(page).to have_button '新規登録'
        end

        it 'exists login link' do
            expect(page).to have_link 'ログイン'
        end

        it 'password and password confirm are not same' do
        end

    end

    describe 'login' do
        before do
            visit login_path
        end
        describe 'display' do
            it 'exists mail-address window' do
                expect(page).to have_content 'メールアドレス'
            end

            it 'exists password window' do
                expect(page).to have_content 'パスワード'
            end

            it 'exists login button' do
            end

            it 'exists new user link' do
            end
        end
        
        context 'incorrect mail-address, password' do
            it 'input incorrect mail-addresss' do
            end

            it 'input mail-address blank' do
            end

            it 'input incorrect password' do
            end

            it 'input password blank' do
            end

        end
    end

    describe 'logout' do 
        context 'pushing logout button' do
            # before do
            # end

            # it 'exists flash message' do
            # end

            # it 'exists mail address window' do
            # end

            # it 'exists password window' do
            # end

            # it 'exists login button' do
            # end

            # it 'exists new user link' do
            # end
        end 
    end


    describe 'profile' do
        context 'display just after pushing profile button' do
            it 'exists title name' do
            end

            it 'exists name window with unchanged name' do
            end

            it 'exists title mail-address' do
            end            
            
            it 'exists mail-address window with unchanged mail-address' do
            end

            it 'exists title profile picture' do
            end

            it 'exists profile picture unchanged' do
            end

            it 'exists title password' do
            end

            it 'exists password unchanged' do
            end
            
            it 'exists update button' do
            end
        end

        context 'change profile data' do
            it 'changes name only' do
            end

            it 'changes mail-address only' do
            end

            it 'changes profile picture only' do
            end
            
            it 'changes password only' do
            end
        end
    end

end