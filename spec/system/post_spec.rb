require "rails_helper"

RSpec.describe "Posts", type: :system do
    before do
        FactoryBot.send(:user_with_posts, posts_count: 35)
        @user = Post.first.user
    end

    describe '#home' do
        before do
            visit root_path
        end

        it '30件表示されていること' do
            target_selectors = all(".post")
            expect(target_selectors.count).to eq 10
        end

        it 'ページネーションのタグが1つ表示されること' do
            target_selectors = all('div.pagination')
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
end