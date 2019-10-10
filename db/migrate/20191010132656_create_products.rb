class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.belongs_to :brand
      t.belongs_to :catagory
      t.string :name
      t.float :sales_price
      t.float :retail_price

      t.timestamps
    end
  end
end
