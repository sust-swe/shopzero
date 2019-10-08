class Brand < ApplicationRecord

  validates :name, uniqueness: true, presence: true

end
