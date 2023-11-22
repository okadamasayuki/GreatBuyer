require 'rails_helper'

RSpec.describe "Sesssions", type: :system do
    describe '#new' do
        context '無効な値の場合' do
            it 'flashメッセージが表示される' do
                visit login_path

                fill_in "メールアドレス", with: ''
                fill_in "パスワード", with: ''
                click_button "ログイン"

                expect(page).to have_selector 'div.alert.alert-danger'
            end
        end

        context '有効な値の場合' do
            let(:user) { FactoryBot.create(:user) }

            it 'ユーザのHomeページが表示されること' do
                visit login_path

                fill_in 'メールアドレス', with: user.email
                fill_in 'パスワード', with: user.password
                click_button "ログイン"

                expect(page).to have_selector 'input#word.search-box'
                expect(page).to have_selector 'div.alert.alert-success'
            end
        end
    end

    describe '/logout' do
        before do
            user = FactoryBot.create(:user)
            post login_path, params: { session: { email: user.email,
                                                  password: user.password } }
        end

        it 'ログアウトできること' do
            expect(logged_in?).to be_truthy

            delete logout_path
            expect(logged_in?).to_not be_truthy
        end

        it '2回連続でログアウトしてもエラーにならないこと' do
            delete logout_path
            delete logout_path
            expect(response).to redirect_to login_path
        end
    end
end


