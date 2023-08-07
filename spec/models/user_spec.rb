require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Example User', email: 'rspec_test@example.com', password: 'password') }
 
  it 'userが有効であること' do
    expect(user).to be_valid
  end
end
