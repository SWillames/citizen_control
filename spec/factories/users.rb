FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { 'secret123' }
    name { Faker::Name.name }
  end
end
