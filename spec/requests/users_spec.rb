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
end