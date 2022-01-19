class Product < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :image_url, presence: true
  validates :description, presence: true, length: { in: 10..500 }
  validates :quantity, presence: true, numericality: { only_integer: true}


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