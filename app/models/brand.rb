class Brand < ApplicationRecord
  has_many :products
  has_many :categories, through: :products
  validates :name, uniqueness: true, presence: true

end
