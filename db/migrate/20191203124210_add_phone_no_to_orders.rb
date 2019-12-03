class AddPhoneNoToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :phone_no, :string
  end
end
