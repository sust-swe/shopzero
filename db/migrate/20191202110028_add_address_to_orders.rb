class AddAddressToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :house_no, :string
    add_column :orders, :road, :string
    add_column :orders, :area, :string
    add_column :orders, :city, :string
    add_column :orders, :country, :string
  end
end
