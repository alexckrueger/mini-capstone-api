class Product < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { in: 10..500 }
  validates :quantity, presence: true, numericality: { only_integer: true}

  has_many :images
  belongs_to :supplier
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :product_categories
  has_many :categories, through: :product_categories

  scope :title_search, ->(search_terms) { where("name ILIKE ?", "%#{search_terms}%") if search_terms }

  scope :discounted, ->(check_discount) { where("price < ?", 10) if check_discount }

  scope :sorted, ->(sort, sort_order) {
    if sort == "price"
      if sort_order == "desc"
        order(price: :desc)
      else
        order(:price)
      end
    else
      order(id: :asc)
    end
  }

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

