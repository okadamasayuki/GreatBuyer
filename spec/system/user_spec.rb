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
end