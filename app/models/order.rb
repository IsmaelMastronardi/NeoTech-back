class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  scope :current_order, -> { where(completed: false) }
  scope :past_orders, -> { where(status: true) }

  validates :total_price, presence: true

  def calculate_total_price
    total_price = 0.0
  
    @order_items = self.order_items.includes(:item)
    @order_items.each do |order_item|
      total_price += order_item.quantity * order_item.item.price
    end
  
    self.total_price = total_price
  end

  def complete_order
    update(completed: true)
  end
end
