class Product < ApplicationRecord
  has_one :parameter, dependent: :destroy
  has_many :order_details
  has_many :ratings
  has_many :comments

  mount_uploader :picture, PictureUploader

  validates :name, presence: true, length: {maximum: Settings.product.name.maximum_length}
  validates :price, presence: true
  validates :quantity, presence: true

  scope :sort_by_name, ->{order :name}
  scope :search_by_name, ->(content){where(" name like ?", "%#{content}%")}
  scope :search_by_price, ->(prices){where(price: prices) if prices.present?}
  scope :search_by_cate, ->(category_id){where category_id: category_id}
end
