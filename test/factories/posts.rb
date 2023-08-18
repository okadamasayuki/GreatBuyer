FactoryBot.define do
    factory :orange, class: Post do
        discount { 200 }
        price { 1000 }
        memo { 'I just bought an orange!' }
    end
end

def user_with_posts(posts_count: 5)
    FactoryBot.create(:user) do |user|
        FactoryBot.create_list(:orange, posts_count, user: user)
    end
end
  