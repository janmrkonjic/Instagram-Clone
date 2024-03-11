class Post < ApplicationRecord
  RESIZE_DIMENSIONS = [1500, 1500]
  enum :status, [:cropping, :applying_filter, :final_draft, :published]
  
  belongs_to :user
  has_one_attached :photo
  has_rich_text :description
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

end
