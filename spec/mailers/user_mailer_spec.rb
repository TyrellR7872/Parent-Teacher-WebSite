require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "new_message" do
    user = UserAccount.new(password: "tester1", name: "testerman", password_confirmation: "tester1", email: "to@example.org")
    let(:mail) { UserMailer.new_message user, {subject: "New message", sender: "Carey", body: "Is this working?"} }

    it "renders the headers" do
      expect(mail.subject).to eq("[HCS-PTO] New message")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["hcs.pto.app@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hello testerman!")
      expect(mail.body.encoded).to match("from Carey")
      expect(mail.body.encoded).to match("Is this working?")
    end
  end

end
