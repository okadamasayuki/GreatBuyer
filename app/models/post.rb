class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :discount, presence: true, numericality: true
  validates :price,    presence: true, numericality: true
  validates :image,    content_type: { in: %w[image/jpeg image/gif image/png],
                                       message: "must be a valid image format"},
                       size:         { less_than: 5.megabytes,
                                       message: "should be less than 5MB" }

  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
