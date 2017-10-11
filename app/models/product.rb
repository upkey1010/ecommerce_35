class Product < ApplicationRecord
  has_one :parameter
  has_many :order_details
  has_many :ratings
  has_many :comments

  scope :sort_by_name, ->{order :name}
  scope :search_by_name, ->(content){where(" name like ?", "%#{content}%")}
end
