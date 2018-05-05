require 'rails_helper'

RSpec.describe Request, type: :model do
  describe "check attributes and methods" do
    it "should be able to create a Request object which has correct methods" do
      ua = UserAccount.create!(password: "testpass", email: "testing@colgate.com", accounttype: "Parent", name: "Tester Name", childname: "Test Child", childgrade: 5, homeaddress: "123 Test Street", admin: false)
      req = Request.create!(funding: true, projectname: "Bake Sale", accounttype: "Teacher", description: "Cupcakes, cookies, brownies, and more!",students: 50, datesubmit: "5/1/18", datemailed: "4", price: 12.34, attachments: "request.txt", user_account_id: ua.id)
      expect(req).to respond_to :funding
      expect(req).to respond_to :projectname
      expect(req).to respond_to :accounttype
      expect(req).to respond_to :description
      expect(req).to respond_to :datesubmit
      expect(req).to respond_to :datemailed
      expect(req).to respond_to :attachments
      expect(req).to respond_to :first_page?
      expect(req).to respond_to :last_page?
      expect(req).to respond_to :previous_page
      expect(req).to respond_to :next_page
      expect(req).to respond_to :current_page
      expect(req).to respond_to :pages

    end

    it "should belong to a user account" do
      re = Request.reflect_on_association(:user_account)
      expect(re.macro).to eq(:belongs_to)
    end
  end
end
