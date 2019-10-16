class Category < ApplicationRecord
  has_many :products
  has_many :brands, through: :products
  validates :name, uniqueness: true, presence: true
end
