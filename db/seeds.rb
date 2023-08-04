# メインのサンプルユーザを1人作成する
User.create!(name: "Example User",
             email: "example@example.com",
             password:              "password",
             password_confirmation: "password")

# 追加のユーザをまとめて生成する           
99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@example.com" 
password = "password"
User.create!(name: name,
             email: email,
             password:              password,
             password_confirmation: password)
end

# ユーザの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
users.each do |user|
    50.times do
        memo = Faker::Lorem.sentence(word_count: 5)
        price = Faker::Number.between(to: 10000) 
        discount = Faker::Number.between(to: 1000) 
        user.posts.create!(discount: discount, price: price, memo: memo)
    end
end

# 以下のリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each do |followed| 
    user.follow(followed)
end
followers.each do |follower|
    follower.follow(user)
end

