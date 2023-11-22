require "rails_helper"

RSpec.describe "Posts", type: :system do
    before do
        FactoryBot.send(:user_with_posts, posts_count: 15)
        @user = Post.first.user
        @user.password = 'password'
        log_in @user

        # visit login_path
        # fill_in 'メールアドレス', with: @user.email
        # fill_in 'パスワード',    with: @user.password
        # click_button 'ログインする！'
    end

    describe 'static_pages#home' do
        before do
            visit root_path
        end

        it '10件表示されていること' do
            target_selectors = all(".post")
            expect(target_selectors.count).to eq 10
        end

        it 'ページネーションのタグが1つ表示されること' do
            target_selectors = all('.pagination')
            expect(target_selectors.count).to eq 1
        end

        describe 'postが正しく表示されていること' do
            it 'discountについて' do
                @user.posts.paginate(page: 1).each do |post|
                    expect(page).to have_content post.discount
                end
            end

            it 'priceについて' do
                @user.posts.paginate(page: 1).each do |post|
                    expect(page).to have_content post.price
                end
            end

            it 'memoについて' do
                @user.posts.paginate(page: 1).each do |post|
                    expect(page).to have_content post.memo
                end
            end
        end
    end

    describe '#new' do
        before do
            visit new_post_path
        end

        # fill correct input

        it 'increase 1 on database' do
            expect {
                fill_in '購入価格', with: '475'
                fill_in '節約額'  , with: '45'
                # fill_in '一言メモ：'          , with: 'ここには一言コメントを書きます'
                click_button '投稿'
            }.to change(Post, :count).by 1
        end

        # fill incorrect input

        it 'input price as blank' do
            expect {
                fill_in '購入価格', with: ''
                fill_in '節約額'  , with: '45'
                # fill_in '一言メモ：'          , with: 'ここには一言コメントを書きます'
                click_button '投稿'
            }.not_to change(Post, :count)
        end

        it 'input price as character' do
            expect {
                fill_in '購入価格', with: 'price'
                fill_in '節約額'  , with: '45'
                # fill_in '一言メモ：'          , with: 'ここには一言コメントを書きます'
                click_button '投稿'
            }.not_to change(Post, :count)
        end

        it 'input save money as blank' do
            expect {
                fill_in '購入価格', with: '475'
                fill_in '節約額'  , with: ''
                # fill_in '一言メモ：'          , with: 'ここには一言コメントを書きます'
                click_button '投稿'
            }.not_to change(Post, :count)
        end

        it 'input save money as character' do
            expect {
                fill_in '購入価格', with: '475'
                fill_in '節約額'  , with: 'save'
                # fill_in '一言メモ：'          , with: 'ここには一言コメントを書きます'
                click_button '投稿'
            }.not_to change(Post, :count)
        end

        # it 'attach too large picture' do
        #     expect {
        #         fill_in '購入価格', with: '475'
        #         fill_in '節約額'  , with: 'save'
        #         # fill_in '一言メモ：'          , with: 'ここには一言コメントを書きます'
        #         click_button '投稿'
        #     }.not_to change(Post, :count)
        # end

        # it 'attach wrong format picture' do
        #     expect {
        #         fill_in '購入価格', with: '475'
        #         fill_in '節約額'  , with: 'save'
        #         # fill_in '一言メモ：'          , with: 'ここには一言コメントを書きます'
        #         click_button '投稿'
        #     }.not_to change(Post, :count)
        # end

    end

    # describe '#destroy' do
        it 'decrease 1 by pushing delete button' do
        end
    # end

    # describe '#update' do
        it 'changes discount' do
        end

        it 'changes bought price' do
        end

        it 'changes memo' do
        end

        it 'changes shop' do
        end

        it 'changes picture' do
        end

    # end


    # describe 'favorite' do
        it 'increase favorite count 1 by adding favorite' do
        end

        it 'decrease favorite count 1 by removing favorite' do
        end
    # end

end