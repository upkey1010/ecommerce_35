FactoryGirl.define do
  factory :user do
    name "Tin Nguyen"
    email Faker::Internet.email
    password "123123"
    password_confirmation "123123"
    address "Da nang"
    admin false
    phone "0123456789"
  end
end

