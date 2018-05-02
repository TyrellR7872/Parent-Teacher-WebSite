require 'rails_helper'

RSpec.describe Request, type: :model do
  describe "check attributes and methods" do
    it "should be able to create a Request object which has correct methods" do
      ua = UserAccount.create!(password: "testpass", email: "testing@colgate.com", accounttype: "Parent", name: "Tester Name", childname: "Test Child", childgrade: 5, homeaddress: "123 Test Street", admin: false)
      req = Request.create!(requesttype: "funding", projectname: "Bake Sale", accounttype: "Teacher", description: "Cupcakes, cookies, brownies, and more!", datesubmit: "5/1/18", datemailed: "4", price: 12.34, attachments: "request.txt", user_account: ua)
      expect(req).to respond_to :requesttype
      expect(req).to respond_to :projectname
      expect(req).to respond_to :accounttype
      expect(req).to respond_to :description
      expect(req).to respond_to :datesubmit
      expect(req).to respond_to :datemailed
      expect(req).to respond_to :attachments
    end

    it "should belong to a user account" do
      re = Request.reflect_on_association(:user_account)
      expect(re.macro).to eq(:belongs_to)
    end
  end
end
