class Item < ApplicationRecord
  belongs_to :categories
  has_many :cart_items
  has_many :carts, through: :cart_items

  validates :name, presence: :true
  validates :description, presence: :true
  validates :price, presence: :true
  validates :image, presence: :true
  validates :quantity, presence: :true
end
