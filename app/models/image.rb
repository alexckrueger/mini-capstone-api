class Image < ApplicationRecord
  validates :product_id, presence: true
  validate :url, presence: true
  
  belongs_to :product
end
