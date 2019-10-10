class Brand < ApplicationRecord
  has_many :products
  validates :name, uniqueness: true, presence: true

end
