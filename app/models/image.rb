class Image < ApplicationRecord
  validates :product_id, presence: true
  validates :url, presence: true
  
  belongs_to :product
end
