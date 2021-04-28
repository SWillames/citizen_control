require 'rails_helper'

RSpec.describe Citizen, type: :model do
  context "relationship" do
    it { is_expected.to have_one(:address)}
  end
  context 'validations' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:birth_date) }
    it { is_expected.to validate_presence_of(:telephone) }
    it { is_expected.to validate_presence_of(:status) }
  end

  before(:each) do
    @citizen = create(:citizen)
    @citizen1 = build(:citizen, email: @citizen.email, cpf: @citizen.cpf)
  end

  it 'expected validate uniqueness of email' do
    expect validate_uniqueness_of(:email).ignoring_case_sensitivity
    expect(@citizen1).not_to be_valid
    expect(@citizen1.errors[:email]).to be_present
  end

  it 'expected validate uniqueness of cpf' do
    expect validate_uniqueness_of(:cpf)
    expect(@citizen1).not_to be_valid
    expect(@citizen1.errors[:cpf]).to be_present
  end

  %W[
    invalid
    a@a
    a@a.a
    a..@example.org
    a..a@example.org
    ].each do |email|
    it "requires #{email} a valid email" do
      citizen = Citizen.create(email: email)
      expect(citizen.errors[:email].size).to be>=1
    end
  end

  %W[
    j-doe@example.com
    john@example.com
    john.doe@example.com
    jhon_doe@example.com
    jhon@sub.example.com
    john@example-domain.com
    jhon@example.io
    john@example.com.br
    john@example.co.uk
    john+spam@example.com
    JOHN@EXAMPLE.COM
    sergio@google.com
    ].each do |email|
    it "Accepts valid email #{email}" do
      citizen = Citizen.create(email: email)
      expect(citizen.errors[:email].count).to eq 0
    end
  end

  %w[
		abcdfgh
		123456789ab
		ab145879cxv
		@1a254#$%a!
		12345
		invalid
		].each do |cpf|
    it "requires #{cpf} as valid cpf" do
      citzen = Citizen.create(cpf: cpf)
      expect(citzen.errors[:cpf].size).to be >= 1
    end
  end

  %w[
		123456789
		1234567891011
		154679584651
		14896301746872
		12345
		].each do |cpf|
    it "requires #{cpf} as valid cpf length" do
      citizen = Citizen.create(cpf: cpf)
      expect(citizen.errors[:cpf].size).to be >= 1
    end
  end

  %w[
		12345678910
		12345678911
		15467958465
		14896301746
		12345965471
		].each do |cpf|
    it "requires #{cpf} as valid cpf length" do
      citizen = Citizen.create(cpf: cpf)
      expect(citizen.errors[:cpf].size).to eq 0
    end

  end
end
