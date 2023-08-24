class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :discount, presence: true, numericality: true
  validates :price,    presence: true, numericality: true
end
