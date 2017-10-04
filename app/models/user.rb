class User < ApplicationRecord
  has_many :orders
  has_many :ratings
  has_many :comments
  has_many :products, through: :ratings
  has_many :user_suggestions
  has_many :viewed_product_by_users
end
