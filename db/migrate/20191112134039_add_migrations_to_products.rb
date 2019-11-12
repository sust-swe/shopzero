class AddMigrationsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :features, :text
    add_column :products, :stock, :integer
    add_column :products, :description, :text
  end
end
