require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.create :user}
  subject {user}

  context "associations" do
    it {is_expected.to have_many :orders}
    it {is_expected.to have_many :ratings}
    it {is_expected.to have_many :comments}
    it {is_expected.to have_many :products}
    it {is_expected.to have_many :user_suggestions}
  end

  context "validates" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_length_of(:name).is_at_most(50)}
    it {is_expected.to validate_presence_of(:email)}
    it {is_expected.to validate_length_of(:email).is_at_most(255)}
    it {is_expected.to validate_presence_of(:phone)}
    it {is_expected.to validate_presence_of(:address)}
    it {is_expected.to validate_length_of(:address).is_at_most(255)}
    it {is_expected.to validate_length_of(:password).is_at_least(6)}
  end

  context "columns" do
    it {is_expected.to have_db_column(:name).of_type(:string)
      .with_options(length: {maximum: 50}, presence: true, uniqueness: true)}
    it {is_expected.to have_db_column(:email).of_type(:string)
      .with_options(length: {maximum: 255}, presence: true)}
    it {is_expected.to have_db_column(:password_digest).of_type(:string)}
    it {is_expected.to have_db_column(:remember_digest).of_type(:string)}
    it {is_expected.to have_db_column(:phone).of_type(:string)
      .with_options(presence: true, uniqueness: true)}
    it {is_expected.to have_db_column(:address).of_type(:text)}
    it {is_expected.to have_db_column(:admin).of_type(:boolean)}
    it {is_expected.to have_db_column(:picture).of_type(:string)}
   end

  context "when name is not valid" do
    before {subject.name = ""}
    it {is_expected.not_to be_valid}
  end

  context "when name is too long" do
    before {subject.name = Faker::Lorem.characters(55)}
    it {is_expected.not_to be_valid}
  end

  context "when email is not valid" do
    before {subject.email = ""}
    it {is_expected.not_to be_valid}
  end

  context "when email is too long" do
    before {subject.email = Faker::Internet.email(Faker::Lorem.characters(255))}
    it {is_expected.not_to be_valid}
  end
  context "when address is not valid" do
    before {subject.address = ""}
    it {is_expected.not_to be_valid}
  end

  context "when address is too long" do
    before {subject.address = Faker::Lorem.characters(256)}
    it {is_expected.not_to be_valid}
  end
  context "when pasword is not valid" do
    before {subject.email = ""}
    it {is_expected.not_to be_valid}
  end

  context "when password is too short" do
    before {subject.email = Faker::Lorem.characters(5)}
    it {is_expected.not_to be_valid}
  end
end
