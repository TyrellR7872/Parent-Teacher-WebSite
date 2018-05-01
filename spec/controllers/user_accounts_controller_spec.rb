require 'rails_helper'

RSpec.describe UserAccountsController, type: :controller do


  describe "check failure when entered input does not meet requirements set" do
    it "returns an error when no email address is entered and fails to create a user account" do
      expect {
          UserAccount.create!(email: "",childgrade: "11",childname: "Lamb Nose",homeaddress: "North Pole",name: "Red Nosed Rudolph", password: "SnowChristmasMustGo", password_confirmation: "SnowChristmasMustGo")}.to raise_exception ActiveRecord::RecordInvalid
    end
    it "returns an error when the password input by the user is < 6" do
      expect {
          UserAccount.create!(email: "",childgrade: "11",childname: "Lamb Nose",homeaddress: "North Pole",name: "Red Nosed Rudolph", password: "SnowChristmasMustGo", password_confirmation: "SnoGo")}.to raise_exception ActiveRecord::RecordInvalid
    end
  end


  describe "GET #show" do
    login_user

    it "should have a current_user" do
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user_account).to_not eq(nil)
    end


    it "returns http success" do
      expect(UserAccount).to receive(:find).with(eq(subject.current_user_account.id)).and_return(subject.current_user_account)
      get :show, :params => {:id => subject.current_user_account.id}
      expect(response).to have_http_status(:success)
    end


  end

  describe "DELETE #destroy" do
    login_user
    # UserAccounts::RegistrationsController#destroy
    it "should delete a user account successfully with click and password confirmation" do
      expect(UserAccount).to receive(:delete).with(subject.current_user_account.id).and_return(subject.current_user_account)
      get :delete, :params => {:id => subject.current_user_account.id, :current_password => subject.current_user_account.password_confirmation}
    end

  end


end
