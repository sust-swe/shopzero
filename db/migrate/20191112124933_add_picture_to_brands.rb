class AddPictureToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :picture, :string
  end
end
