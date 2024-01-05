class Cart < ApplicationRecord
  belongs_to :User
  has_many :cart_items
  has_many :items, through: :cart_items

  validates :total_price, presence: :true
end
