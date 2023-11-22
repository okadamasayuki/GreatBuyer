require 'rails_helper'

RSpec.describe User, type: :model do 
  # user = FactoryBot.create(:user)
  let(:user) { User.new(name: 'Example User', email: 'user@example.com', 
    password: 'password', password_confirmation: 'password') }

  it 'userが有効であること' do
    expect(user).to be_valid
  end

  it 'nameが必須でないこと' do
    user.name = ''
    expect(user).to_not be_valid
  end

  it 'nameが必須であること' do
    user.email = ''
    expect(user).to_not be_valid
  end

  it 'nameは50文字いないであること' do
    user.name = 'a' * 51
    expect(user).to_not be_valid
  end

  it 'emailは255文字以内であること' do
    user.email = "#{'a' * 244}@example.com"
    expect(user).to_not be_valid
  end

  it 'emailは重複して登録できないこと' do
    duplicate_user = user.dup
    user.save
    expect(duplicate_user).to_not be_valid
  end

  it 'passwordが必須であること' do
    user.password = user.password_confirmation = ' ' * 8
    expect(user).to_not be_valid
  end

  it 'passwordは8文字以上であること' do
    user.password = user.password_confirmation = 'a' * 7
    expect(user).to_not be_valid
  end

end
