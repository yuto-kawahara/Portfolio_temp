class Product < ApplicationRecord
  attachment :image
  validates :name, presence: true
  validates :price, presence: true
  has_many :cart_items, dependent: :destroy
end
