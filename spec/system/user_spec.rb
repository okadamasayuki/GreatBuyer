require "rails_helper"

RSpec.describe "Users", type: :system do

    describe '#create' do
        context '無効な値の場合' do
            it 'エラーメッセージのflashが表示されていること' do
                visit new_user_path
                fill_in 'ユーザ名', with: ''
                fill_in 'メールアドレス', with: 'user@invalid'
                fill_in 'パスワード', with: 'pass'
                fill_in 'パスワード（確認）', with: 'word'
                click_button '新規登録'

                expect(page).to  have_content 'ユーザ作成できませんでした'
            end
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