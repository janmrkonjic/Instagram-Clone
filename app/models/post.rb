class Post < ApplicationRecord
  RESIZE_DIMENSIONS = [500, 500]
  enum :status, [:cropping, :applying_filter, :final_draft, :published]
  
  belongs_to :user
  has_one_attached :photo
  has_rich_text :description
end
