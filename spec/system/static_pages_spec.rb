require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
    before do
        FactoryBot.send(:user_with_posts, posts_count: 35)
    end

    it 'headerにリンクがあること' do
        visit login_path
        expect(page).to have_link href: root_path
        expect(page).to have_link href: new_post_path
        expect(page).to have_link href: find_friend_path
        expect(page).to have_link href: edit_user_path
        expect(page).to have_link href: logout_path
    end
end