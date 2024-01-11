class User < ApplicationRecord
  has_one :cart

  after_create :create_cart

  validates :name, presence: :true
  validates :email, presence: :true
  validates :password, presence: :true

  private
  
  def create_cart
    Cart.create(user: self)
  end
end
