require 'rails_helper'

RSpec.describe UserAccountsController, type: :controller do

  describe "check attributes" do
    it "creates a user account with the appropriate attributes and methods" do
      user = UserAccount.create!(username: "Jdoer",email: "jdoe@yahoo.com",childgrade: "11",childname: "John Doe",homeaddress: "Hamilton, Canada",name: "Jane Doe", password: "PinkPank", password_confirmation: "PinkPank")
      expect(user).to respond_to :username
      expect(user).to respond_to :email
      expect(user).to respond_to :childgrade
      expect(user).to respond_to :childname
      expect(user).to respond_to :homeaddress
      expect(user).to respond_to :name
      expect(user).to respond_to :password
      expect(user).to respond_to :password_confirmation
      expect(user).to respond_to :destroy
      expect(user).to respond_to :update
    end
  end
  describe "check failure when entered input does not meet requirements set" do
    it "returns an error when the username length < 5 and fail to create a user account" do
      expect {
        UserAccount.create!(username: "Ruby",email: "railsy@yahoo.com",childgrade: "10",childname: "Ruby Rails",homeaddress: "Ontario, Canada",name: "Ruby Ran", password: "VierDrei", password_confirmation: "VierDrei")}.to raise_exception ActiveRecord::RecordInvalid
    end
    it "returns an error when no email address is entered and fails to create a user account" do
      expect {
          UserAccount.create!(username: "Rudolph",email: "",childgrade: "11",childname: "Lamb Nose",homeaddress: "North Pole",name: "Red Nosed Rudolph", password: "SnowChristmasMustGo", password_confirmation: "SnowChristmasMustGo")}.to raise_exception ActiveRecord::RecordInvalid
    end
    it "returns an error when the password input by the user is < 6" do
      expect {
          UserAccount.create!(username: "Rudolph",email: "",childgrade: "11",childname: "Lamb Nose",homeaddress: "North Pole",name: "Red Nosed Rudolph", password: "SnowChristmasMustGo", password_confirmation: "SnoGo")}.to raise_exception ActiveRecord::RecordInvalid
    end
  end
end
