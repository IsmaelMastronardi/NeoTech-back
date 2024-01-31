class User < ApplicationRecord
  has_one :order

  after_create :create_order

  validates :name, presence: :true

  private
  
  def create_order
    Order.create(user: self)
  end
end
