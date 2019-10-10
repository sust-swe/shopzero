class Brand < ApplicationRecord
  has_many :products
  has_many :catagories, through: :products
  validates :name, uniqueness: true, presence: true

end
