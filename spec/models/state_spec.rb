require 'rails_helper'

RSpec.describe State, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :abbr }
  end

end
