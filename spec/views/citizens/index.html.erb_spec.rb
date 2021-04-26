require 'rails_helper'

RSpec.describe "citizens/index", type: :view do
  before(:each) do
    assign(:citizens, [
      Citizen.create!(
        full_name,: "Full Name,",
        cpf,: "Cpf,",
        email,: "Email,",
        telephone: "Telephone",
        photograph: "Photograph",
        status: "Status"
      ),
      Citizen.create!(
        full_name,: "Full Name,",
        cpf,: "Cpf,",
        email,: "Email,",
        telephone: "Telephone",
        photograph: "Photograph",
        status: "Status"
      )
    ])
  end

  it "renders a list of citizens" do
    render
    assert_select "tr>td", text: "Full Name,".to_s, count: 2
    assert_select "tr>td", text: "Cpf,".to_s, count: 2
    assert_select "tr>td", text: "Email,".to_s, count: 2
    assert_select "tr>td", text: "Telephone".to_s, count: 2
    assert_select "tr>td", text: "Photograph".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
  end
end
