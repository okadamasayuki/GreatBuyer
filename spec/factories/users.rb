FactoryBot.define do
  factory :user do
    name { "Example Michael" } 
    email { "michael@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
