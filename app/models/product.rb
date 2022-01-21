class Product < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { in: 10..500 }
  validates :quantity, presence: true, numericality: { only_integer: true}

  has_many :images
  belongs_to :supplier


  def is_discounted?
    price < 10
  end

  scope :is_discounted, -> { where("price < ?", 10)}

  def tax
    (price * 0.09).round(2)
  end

  def total
    price + tax
  end

end

