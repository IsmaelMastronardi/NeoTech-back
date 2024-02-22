class User < ApplicationRecord
  has_one :current_order, -> { where(completed: false) }, class_name: 'Order', foreign_key: 'user_id'
  has_many :past_orders, -> { where(completed: true) }, class_name: 'Order', foreign_key: 'user_id'

  after_create :create_order

  validates :name, presence: :true
  
  def create_order
    Order.create(user: self)
  end
end
