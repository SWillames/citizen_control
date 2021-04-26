require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      zip_code: "MyString",
      street: "MyString",
      complement: "MyString",
      district: "MyString",
      city: nil
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input[name=?]", "address[zip_code]"

      assert_select "input[name=?]", "address[street]"

      assert_select "input[name=?]", "address[complement]"

      assert_select "input[name=?]", "address[district]"

      assert_select "input[name=?]", "address[city_id]"
    end
  end
end
