class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :product
      t.string :title
      t.float :rating
      t.string :body

      t.timestamps
    end
  end
end
