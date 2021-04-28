require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'relationship' do
    it { is_expected.to belong_to(:citizen) }
    it { is_expected.to belong_to(:city) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :zip_code }
    it { is_expected.to validate_presence_of :street }
    it { is_expected.to validate_presence_of :district }
    it { is_expected.to validate_presence_of :city_id }
    it { is_expected.to validate_presence_of :UF }
  end
end
