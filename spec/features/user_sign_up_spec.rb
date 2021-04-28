require 'rails_helper'

feature 'User sign up' do
  let(:user) { build(:user) }
  scenario 'from home page' do
    visit root_path
    expect(page).to have_link('Sign up')
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Sign up'

    fill_in "Name",	with:  user.name
    fill_in "Email", with: user.email
    fill_in "Password",	with: user.password
    fill_in "Password confirmation", with: user.password
    click_on 'Sign up'

    expect(page).to have_current_path(root_path)
  end

  end