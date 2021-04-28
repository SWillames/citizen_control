FactoryBot.define do
  factory :citizen do
    full_name { Faker::Name.name_with_middle }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    email { Faker::Internet.email }
    birth_date { Faker::Date.between(from: '1960-01-01', to: '2021-01-01') }
    telephone { FFaker::PhoneNumberBR.phone_number }
    photograph { Rack::Test::UploadedFile.new(File.join("#{Rails.root}/spec/fixtures/profile.png")) }
    status { "enabled" }
  end
end
