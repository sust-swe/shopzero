class AddPictureToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :picture, :string
  end
end
