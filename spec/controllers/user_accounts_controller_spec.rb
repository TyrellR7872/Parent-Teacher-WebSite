require 'rails_helper'

RSpec.describe UserAccountsController, type: :controller do


  describe "check failure when entered input does not meet requirements set" do
    it "returns an error when the username length < 5 and fail to create a user account" do
      expect {
        UserAccount.create!(email: "railsy@yahoo.com",childgrade: "10",childname: "Ruby Rails",homeaddress: "Ontario, Canada",name: "Ruby Ran", password: "VierDrei", password_confirmation: "VierDrei")}.to raise_exception ActiveRecord::RecordInvalid
    end
    it "returns an error when no email address is entered and fails to create a user account" do
      expect {
          UserAccount.create!(email: "",childgrade: "11",childname: "Lamb Nose",homeaddress: "North Pole",name: "Red Nosed Rudolph", password: "SnowChristmasMustGo", password_confirmation: "SnowChristmasMustGo")}.to raise_exception ActiveRecord::RecordInvalid
    end
    it "returns an error when the password input by the user is < 6" do
      expect {
          UserAccount.create!(email: "",childgrade: "11",childname: "Lamb Nose",homeaddress: "North Pole",name: "Red Nosed Rudolph", password: "SnowChristmasMustGo", password_confirmation: "SnoGo")}.to raise_exception ActiveRecord::RecordInvalid
    end
  end


  # describe "GET #create" do
  #   it "returns http success" do
  #     get :create, params: {:user_account => { password: "testpass", email: "testuser@test.com", accounttype: "Parent", name: "Tester Name", childname: "Test Child", childgrade: 5, homeaddress: "123 Test Street"}}
  #     expect(response).to have_http_status(:redirect)
  #   end
  # end
  #
  # describe "GET #update" do
  #   before(:example) do
  #     ua = UserAccount.create!(password: "testpass", email: "testuser@test.com", accounttype: "Parent", name: "Tester Name", childname: "Test Child", childgrade: 5, homeaddress: "123 Test Street")
  #   end
  #   it "returns http success" do
  #     get :update, session: {:id => 1},  params: {:id => 1, :user_account => {password: "testpass", email: "testuser@test.com", accounttype: "Parent", name: "Tester Name", childname: "Test Child", childgrade: 5, homeaddress: "123 Test Street"}}
  #     expect(response).to have_http_status(:redirect)
  #   end
  # end
  describe "GET #show" do
    it "redirects to index on a bad id" do
      expect(UserAccount).to receive(:find).and_raise(ActiveRecord::RecordNotFound)
      get :show, :params => {:id => 1}
      expect(response).to redirect_to(new_user_account_registration_path)
    end

    it "returns http success" do
      user = UserAccount.new
      expect(UserAccount).to receive(:find).with(eq(1).or eq("1")).and_return(user)
      get :show, :params => {:id => "1"}
      expect(response).to have_http_status(:success)
    end
  end

end
