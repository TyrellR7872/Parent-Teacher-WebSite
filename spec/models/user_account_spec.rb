require 'rails_helper'

RSpec.describe UserAccount, type: :model do
  describe "check attributes and methods" do
    it "should be able to create a UserAccount object which has correct methods" do
      ua = UserAccount.create!(username: "TestUser", password: "testpass", email: "testuser@test.com", accounttype: "Parent", name: "Tester Name", childname: "Test Child", childgrade: 5, homeaddress: "123 Test Street")
      expect(ua).to respond_to :username
      expect(ua).to respond_to :password
      expect(ua).to respond_to :email
      expect(ua).to respond_to :accounttype
      expect(ua).to respond_to :name
      expect(ua).to respond_to :childname
      expect(ua).to respond_to :childgrade
      expect(ua).to respond_to :homeaddress
    end
  end
end
