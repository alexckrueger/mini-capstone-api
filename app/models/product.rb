class Product < ApplicationRecord

  validates :name, :image_url, :quantity, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0}
  validates :description, length: { in: 10..500 }

  def is_discounted?
    price < 10
  end

  def tax
    (price * 0.09).round(2)
  end

  def total
    price + tax
  end

end

# Validations:
# name presence/uniqueness
# price presence/numericality (not a negative number)
# image_url presence
# description length range (in) between 10 - 500
# quantity presence