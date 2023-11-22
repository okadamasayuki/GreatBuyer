require 'rails_helper'

RSpec.describe "Posts", type: :request do
    describe '#create' do
        context 'ログインの場合' do
            before do
                FactoryBot.send(:user_with_posts, posts_count: 15)
                @user = Post.first.user
                @user.password = 'password'
                log_in @user
            end
            
            let(:correct_post_params) { { post: { discount: '475',
                                                  price:    '45',
                                                  memo:     'ここには一言コメントを書きます' } } }

            let(:wrong_post_params) { { post: { discount: 'ここは数値です',
                                                price:    '45',
                                                memo:     'ここには一言コメントを書きます' } } }

            context '投稿が正しいとき' do
                it '投稿することでデータ数が1増えること' do
                    expect {
                        post posts_path, params: correct_post_params
                    }.to change(Post, :count).by 1
                end

                it 'rootにリダイレクトされること' do
                    post posts_path, params: correct_post_params
                    expect(response).to redirect_to root_path
                end
            end
            
            context '投稿が間違っているとき' do
                it '投稿してもデータ数が増えないこと' do
                    expect {
                        post posts_path, params: wrong_post_params
                    }.to change(Post, :count).by 0
                end

                it '/new_post にリダイレクトされること' do
                    post posts_path, params: wrong_post_params
                    expect(response).to redirect_to new_post_path
                end
            end

        end

        context '未ログインの場合' do
            
        end
    end
end