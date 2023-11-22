require 'rails_helper'

RSpec.describe 'Users', type: :request do
    describe '#create' do
        it '無効な値だと登録されないこと' do
            expect {
                post users_path, params: { user: { name: '',
                                                   email: 'user@invalid',
                                                   password: 'pass',
                                                   password_confirmation: 'word' } }
                }.to_not change(User, :count)
        end

        context '有効な値の場合' do
            let(:user_params) { { user: { name: 'Example User',
                                          email: 'user@example.com',
                                          password: 'password',
                                          password_confirmation: 'password' } } }

            it '登録されること' do
                expect {
                    post users_path, params: user_params
                }.to change(User, :count).by 1
            end

            it 'rootにリダイレクトされること' do
                post users_path, params: user_params
                expect(response).to redirect_to root_path
            end

            it 'flashが表示されること' do
                post users_path, params: user_params
                expect(flash).to be_any
            end

            it 'ログイン状態であること' do
                post users_path, params: user_params
                expect(logged_in?).to be_truthy
            end
        end
    end

    describe 'PATCH /users' do
        let!(:user) { FactoryBot.create(:user) }

        it 'ユーザ名が表示されていること' do
            log_in(user)
            get edit_user_path
            expect(response.body).to include "プロフィール"
        end

        context '無効な値の場合' do
            before do
                log_in(user)
            end

            it '更新できないこと' do
                patch user_path(user), params: { user: { name: '',
                                                         email: ''} }
                user.reload
                expect(user.name).to_not eq ''
                expect(user.email).to_not eq ''
            end

            it '更新後にeditのページが表示されていること' do
                get edit_user_path
                patch user_path(user), params: { user: { name: '',
                                                         email: '' } }
                expect(response.body).to  include "プロフィール"
            end

            it 'プロフィール更新できませんでしたと表示されていること' do
                patch user_path(user), params: { user: { name: '', 
                                                         email: ''}}
                expect(response.body).to include 'プロフィール更新できませんでした'
            end
        end

        context '有効な値の場合' do
            before do
                @name = 'Valid Example'
                @email = 'valid@example.com'
                log_in(user)
                patch user_path(user), params: { user: { name: @name,
                                                         email: @email } }
            end

            it '更新できること' do
                user.reload
                expect(user.name).to eq @name
                expect(user.email).to eq @email
            end

            it 'Homeページにリダイレクトすること' do
                expect(response).to redirect_to root_path
            end
        end

    end
end