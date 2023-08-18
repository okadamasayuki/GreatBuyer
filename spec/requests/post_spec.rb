require 'rails_helper'

RSpec.describe "Posts", type: :request do
    describe '#create' do
        context 'ログインの場合' do
            FactoryBot.send(:user_with_posts, posts_count: 35)
            let(:post_params) { { post: { discount: '475',
                                          price: '45',
                                          memo: 'ここには一言コメントを書きます' } } }

            it '投稿することでデータ数が1増えること' do
                expect {
                    post posts_path, params: post_params
                }.to change(Post, :count).by 1
            end
        end

        context '未ログインの場合' do
            let(:post_params) { { post: { discount: '475',
                                  price: '45',
                                  memo: 'ここには一言コメントを書きます' } } }

            it '投稿してもデータ数が増えないこと' do
                expect {
                    post posts_path, params: post_params
                }.to change(Post, :count)
            end
            
        end
    end
end