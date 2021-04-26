require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        zip_code: "Zip Code",
        street: "Street",
        complement: "Complement",
        district: "District",
        city: nil
      ),
      Address.create!(
        zip_code: "Zip Code",
        street: "Street",
        complement: "Complement",
        district: "District",
        city: nil
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", text: "Zip Code".to_s, count: 2
    assert_select "tr>td", text: "Street".to_s, count: 2
    assert_select "tr>td", text: "Complement".to_s, count: 2
    assert_select "tr>td", text: "District".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
