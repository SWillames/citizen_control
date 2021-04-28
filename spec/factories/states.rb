FactoryBot.define do
  factory :state do
    name { Faker::Address.state }
    abbr { Faker::State.state_abbr }
  end
end
