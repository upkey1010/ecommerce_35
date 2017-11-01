FactoryGirl.define do
  factory :user do
    name "Tin Nguyen"
    email "upkey1010@gmail.com"
    password "123123"
    password_confirmation "123123"
    address "Da nang"
    admin false
    phone "0978575159"
  end
end

