FactoryBot.define do
  factory :user do
    username { Faker::Name.first_name }
    password { Faker::String.random(length: 6..30) }
  end
end
