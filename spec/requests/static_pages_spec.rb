require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
    before do
        FactoryBot.send(:user_with_posts, posts_count: 15)
        @user = Post.first.user
        @user.password = 'password'
        log_in @user
    end

    describe '#home' do
        before do
            get root_path
        end

        it '正常にレスポンスを返すこと' do
            expect(response).to have_http_status :ok
        end

    end

    describe '#find_friend' do
        it '正常にレスポンスを返すこと' do
            get find_friend_path
            expect(response).to have_http_status :ok
        end
    end

    describe '#friends' do
        it '正常にレスポンスを返すこと' do
            get friends_path
            expect(response).to have_http_status :ok
        end
    end

end