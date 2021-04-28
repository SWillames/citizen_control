require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password)}

    before(:each) do
      user = create(:user)
      @user1 = build(:user, email: user.email)
    end

    it "expected validate uniqueness of email" do
      expect validate_uniqueness_of(:email).ignoring_case_sensitivity
      expect(@user1).not_to be_valid
      expect(@user1.errors[:email]).to be_present
    end

    %W[
    invalid
    a@a
    a@a.a
    a..@example.org
    a..a@example.org
    ].each do |email|
      it "requires #{email} a valid email" do
        user = User.create(email: email)
        expect(user.errors[:email].size).to be>=1
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
        user = User.create(email: email)
        expect(user.errors[:email].count).to eq 0
      end
    end
  end


end
