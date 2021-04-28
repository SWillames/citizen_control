FactoryBot.define do
  factory :city do
    name { Faker::Address.city }
    state { create(:state) }
  end
end
