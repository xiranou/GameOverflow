require 'rails_helper'

describe User do
  describe "validations" do
    it { should validate_presence_of :handle }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password_digest }
    it { should validate_uniqueness_of :handle }
    it { should validate_uniqueness_of :email }
    it { should allow_value("something@gmail.com", "someotherthing@hotmail.com").for(:email) }
    it { should_not allow_value("@gmail.com", "someotherthing.com").for(:email) }
    it { should have_secure_password }
  end
end