class Post < ApplicationRecord
  RESIZE_DIMENSIONS = [1200, 1200]
  enum :status, [:cropping, :applying_filter, :final_draft, :published]
  
  belongs_to :user
  has_one_attached :photo
end
