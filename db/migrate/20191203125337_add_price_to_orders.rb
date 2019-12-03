class AddPriceToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :price, :decimal
  end
end
