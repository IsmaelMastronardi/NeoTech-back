class User < ApplicationRecord
  has_one :cart

  validates :name, presence: :true
  validates :email, presence: :true
  validates :password, presence: :true
end
