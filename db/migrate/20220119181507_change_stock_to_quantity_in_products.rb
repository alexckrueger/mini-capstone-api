class ChangeStockToQuantityInProducts < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :stock, :quantity
  end
end
