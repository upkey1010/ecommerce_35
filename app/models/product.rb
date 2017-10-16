class Product < ApplicationRecord
  has_one :parameter, dependent: :destroy
  has_many :order_details
  has_many :ratings
  has_many :comments

  mount_uploader :picture, PictureUploader

  before_destroy :check_if_has_line_item

  validates :name, presence: true, length: {maximum: Settings.product.name.maximum_length}
  validates :price, presence: true
  validates :quantity, presence: true


  default_scope{where(active: true)}
  scope :sort_by_name, ->{order :name}
  scope :search_by_name, ->(content){where(" name like ?", "%#{content}%")}
  scope :search_by_price, ->(prices){where(price: prices) if prices.present?}
  scope :search_by_cate, ->(category_id){where category_id: category_id}


  private

  def check_if_has_line_item
    if order_details.empty?
      true
    else
      errors.add(:base, t("error_destroy_product"))
      false
    end
  end
end
