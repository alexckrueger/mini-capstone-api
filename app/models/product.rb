class Product < ApplicationRecord

  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end

  def tax
    tax = (price * 0.09).round(2)
    tax
  end

  def total
    total = price + tax
    total
    end

end
