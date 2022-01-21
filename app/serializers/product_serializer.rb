class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :image_url, :description, :is_discounted?, :tax, :total, :quantity

  belongs_to :supplier
end
