class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  scope :current_order, -> { where(completed: false) }
  scope :past_orders, -> { where(status: true) }

  validates :total_price, presence: true

  private

  def complete_order
    update(completed: true)
  end

  def calculate_total_price
    self.total_price = items.sum(:price)
  end

end
