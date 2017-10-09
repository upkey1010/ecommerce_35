class User < ApplicationRecord
  has_many :orders
  has_many :ratings
  has_many :comments
  has_many :products, through: :ratings
  has_many :user_suggestions
  has_many :viewed_product_by_users

  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {maximum: Settings.user.name.maximum_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user.email.maximum_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  VALID_PHONE_REGEX = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/i
  validates :phone, presence: true, format: {with: VALID_PHONE_REGEX}, uniqueness: {case_sensitive: false}
  validates :address, presence: true, length: {maximum: Settings.user.address.maximum_length}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.user.password.minimum_length}

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end
end
