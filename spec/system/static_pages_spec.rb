require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
    before do
        FactoryBot.send(:user_with_posts, posts_count: 35)
    end

    describe 'header' do
        # before do
        #     visit root_path
        # end

        # it '「ホーム」リンクが表示され、想定URLに移動すること' do
        #     expect(page).to have_link 'ホーム', href: root_path
        # end

        # it '「友達」リンクが表示され、想定URLに移動すること' do
        #     expect(page).to have_link '友達', href: friends_path
        # end

        # it '「友達を探す」リンクが表示され、想定URLに移動すること' do
        #     expect(page).to have_link '友達を探す', href: find_friend_path
        # end

        # it '「投稿」リンクが表示され、想定URLに移動すること' do
        #     expect(page).to have_link '投稿', href: new_post_path
        # end
        
    end

end