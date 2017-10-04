class Product < ApplicationRecord
  has_one :parameter
  has_many :order_details
  has_many :ratings
  has_many :comments
end
