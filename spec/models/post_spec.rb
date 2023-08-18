require 'rails_helper'

RSpec.describe Post, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { user.posts.build(discount: '173',
                                price: '15656',
                                memo: "ここには一言メモを書きます") }
  it 'postに追加されること' do
    expect(post).to be_valid
  end

  # it 'user_idがない場合は、無効であること' do
  #   post.user_id = nil
  #   expect(post).to_not be_valid
  # end

	describe 'discount' do
		it '空なら無効であること' do
			post.discount = ''
			expect(post).to_not be_valid
		end

		it '文字列は無効であること' do
			post.discount = '割引額'
			expect(post).to_not be_valid
		end
	end

	describe 'price' do
		it '空なら無効であること' do
			post.price = ''
			expect(post).to_not be_valid
		end

		it '文字列は無効であること' do
			post.price = '標準額'
			expect(post).to_not be_valid
		end
	end
end

