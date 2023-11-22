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
end


