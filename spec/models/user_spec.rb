require 'rails_helper'

RSpec.describe User, type: :model do 
  it 'userが有効であること' do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end
end
