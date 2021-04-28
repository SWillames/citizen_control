require 'rails_helper'

feature 'User register a citizen'do
  let(:user) { create(:user) }
  let(:user) { create(:user) }
  scenario 'successfully' do
    login_as(user, scope: :user)
    visit root_path
    expect(page).to have_link('New Citizen')

    click_on 'New Citizen'
    fill_in "Full name", with: Faker::Name.name
    fill_in "Cpf", with: Faker::IDNumber.brazilian_citizen_number
    fill_in "Email", with: Faker::Internet.email
    select "Birth date", with: Date.current.advance(months: -12)
    fill_in "Telephone", with: FFaker::PhoneNumberBR.phone_number
    fill_in "Photograph", with: "#{Rails.root}/spec/fixtures/profile.png"
    fill_in "Status", with: "enabled"

    click_on "Create Citizen"

    expect(current_path).to eq citizens_path(Citizen.last)
    expect(page).to have_content(Citizen.last)
    end


  end