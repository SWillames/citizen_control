FactoryBot.define do
  factory :address do
    zip_code { (rand(01000000..99999999).to_s) }
    street { Faker::Address.streeta_address }
    complement { Faker::Address.secondary_address }
    district { "Center" }
    city { create(:city) }
    UF { city.state.abbr}
    ibge { "54687" }
    citizen { create(citizen)}
  end
end
