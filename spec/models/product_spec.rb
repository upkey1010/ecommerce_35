require "rails_helper"

RSpec.describe Product, type: :model do
  let(:product) {FactoryGirl.create :product}
  subject {product}

  context "associations" do
    it {is_expected.to belong_to :category}
    it {is_expected.to have_one :parameter}
    it {is_expected.to have_many :order_details}
    it {is_expected.to have_many :comments}
    it {is_expected.to have_many :ratings}
  end

  context "validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_length_of(:name).is_at_most(100)}
    it {is_expected.to validate_presence_of(:price)}
    it {is_expected.to validate_presence_of(:quantity)}
  end

  context "columns" do
    it {is_expected.to have_db_column(:name).of_type(:string)
      .with_options(length: {maximum: 100}, presence: true)}
    it {is_expected.to have_db_column(:price).of_type(:integer)
      .with_options(presence: true)}
    it {is_expected.to have_db_column(:quantity).of_type(:integer)
      .with_options(presence: true)}
    it {is_expected.to have_db_column(:active).of_type(:boolean)}
    it {is_expected.to have_db_column(:category_id).of_type(:integer)}
  end
end
