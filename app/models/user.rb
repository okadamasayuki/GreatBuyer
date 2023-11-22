class User < ApplicationRecord

    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
    validates :password, presence: true, length: { minimum: 8 }

    mount_uploader :avatar, AvatarUploader
    has_many :posts,     dependent: :destroy
    has_many :favorites, dependent: :destroy

    has_secure_password
    
    # foregin_key（入口）を設定して、Relationモデルに別名をつけた.
    # userモデルからは、この別名（follow）を使って呼び出すことができる.    
    has_many :active_follow, class_name: "Relation", foreign_key: "follower_id"
    # 先ほど名前をつけたテーブルを介して、source（出口）を集めたものをモデルと見立てて、followingと名付けた.
    has_many :following, through: :active_follow, source: :followed

    has_many :passive_follow, class_name: "Relation", foreign_key: "followed_id"
    has_many :followers, through: :passive_follow, source: :follower

    # ---補足（中間テーブルを使った自己結合）---
    # class_name以降で指定すれば、has_manyの後は自由に名前をつけることができる.

    # foreign_keyは、他のモデルとの接続を示す.
    # 記載なしの場合は、<has_many、belongs_toの後 : following>_idとなる.

    # throughは、中間テーブルは〇〇だよ

    # class_nameを設定している理由は、has_many後の名前とモデル名とが異なるから.

    # sourceで、<has_manyの後 : following>配列の要素を指定している.
    # foreign_key = 入口
    # source      = 出口

    def follow(other_user)
        active_follow.create(followed_id: other_user.id)
        # following << other_user
    end

    def unfollow(other_user)
        active_follow.find_by(followed_id: other_user.id).destroy
    end

    def follow?(other_user)
        following.include?(other_user)
    end

    def already_favorited?(post)
        self.favorites.exists?(post_id: post.id)
    end
end
