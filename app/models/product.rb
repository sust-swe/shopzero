class Product < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :brand
  belongs_to :category
end
