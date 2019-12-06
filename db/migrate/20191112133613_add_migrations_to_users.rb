class AddMigrationsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_no, :string
    add_column :users, :house_no, :string
    add_column :users, :road, :string
    add_column :users, :area, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
  end
end
