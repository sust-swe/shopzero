class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.belongs_to :user
      t.belongs_to :product
      t.integer :count
      t.boolean :checked_at_checkout

      t.timestamps
    end
  end
end
