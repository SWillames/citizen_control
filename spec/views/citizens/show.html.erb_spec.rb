require 'rails_helper'

RSpec.describe "citizens/show", type: :view do
  before(:each) do
    @citizen = assign(:citizen, Citizen.create!(
      full_name,: "Full Name,",
      cpf,: "Cpf,",
      email,: "Email,",
      telephone: "Telephone",
      photograph: "Photograph",
      status: "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name,/)
    expect(rendered).to match(/Cpf,/)
    expect(rendered).to match(/Email,/)
    expect(rendered).to match(/Telephone/)
    expect(rendered).to match(/Photograph/)
    expect(rendered).to match(/Status/)
  end
end
