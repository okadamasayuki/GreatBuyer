require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
    before do
        FactoryBot.send(:user_with_posts, posts_count: 35)
    end

    describe 'header' do
        visit root_path

        expect(page).to have_link href: root_path
        expect(page).to have_link href: new_post_path
        expect(page).to have_link href: find_friend_path
        expect(page).to have_link href: edit_user_path
        expect(page).to have_link href: logout_path

        # it 'exists profile link' do
        #     expect(page).to have_link href:
        # end 

        # it 'exists logout link' do
        #     expect(page).to have_link href: 
        # end
    end

    describe 'common on homePage' do
        # it 'exists flash message' do
        # end

        describe 'search' do
            # it 'exists search window' do
            # end

            # it 'exists search botton' do
                # expect(page).to have_link href: _path
            # end
            
        end

        describe 'profile' do
            # home画面に表示されるプロフィールについて
            # it 'exists profile picture' do
            # end

            # it 'exists user name' do
            # end

            # it 'exists saved total money' do
            # end
        end
    end

        # home画面に表示される投稿について
        # it 'exists save money' do 
        # end

        # it 'exists standard price' do 
        # end

        # it 'exists bought price' do 
        # end

        # it 'exists character -' do 
        # end

        # it 'exists character =' do 
        # end

        # it 'exists memo' do 
        # end
        
        # it 'exists favorite character' do 
        # end

        # it 'exists favorite icon' do 
        # end

        # it 'exists posted date' do 
        # end

        # it 'exists update button' do 
            # expect(page).to have_link href: _path
        # end

        # it 'exists delete button' do 
            # expect(page).to have_link href: _path
        # end

end