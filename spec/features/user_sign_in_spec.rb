require 'rails_helper'

feature 'User sign in' do
  let(:user) { create(:user) }
  scenario 'successfully' do
    visit root_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    expect(page).to have_current_path(root_path)
  end
end