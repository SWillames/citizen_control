FactoryBot.define do
  factory :address do
    zip_code { "MyString" }
    street { "MyString" }
    complement { "MyString" }
    district { "MyString" }
    city { nil }
  end
end
