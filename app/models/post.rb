class Post < ApplicationRecord
  belongs_to :user
  validates :discount, presence: true, numericality: true
  validates :price,    presence: true, numericality: true
end
