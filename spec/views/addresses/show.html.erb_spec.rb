require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      zip_code: "Zip Code",
      street: "Street",
      complement: "Complement",
      district: "District",
      city: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/Complement/)
    expect(rendered).to match(/District/)
    expect(rendered).to match(//)
  end
end
