FactoryGirl.define do
  factory :product do
    name { Faker::Name.name }
    price 3000000
    quantity 100
    category_id 1
  end
end
