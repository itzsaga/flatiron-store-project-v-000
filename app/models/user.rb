class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :carts

  def current_cart=(current_cart)
    @current_cart = self.carts.create
  end

  def current_cart
    @current_cart
  end
end
