require 'rails_helper'

RSpec.describe UserAccountsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create, params: {:user_account => {username: "TestUser", password: "testpass", email: "testuser@test.com", accounttype: "Parent", name: "Tester Name", childname: "Test Child", childgrade: 5, homeaddress: "123 Test Street"}}
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #update" do
    before(:example) do
      ua = UserAccount.create!(username: "TestUser", password: "testpass", email: "testuser@test.com", accounttype: "Parent", name: "Tester Name", childname: "Test Child", childgrade: 5, homeaddress: "123 Test Street")
    end
    it "returns http success" do
      get :update, session: {:id => 1},  params: {:id => 1, :user_account => {username: "TestUser", password: "testpass", email: "testuser@test.com", accounttype: "Parent", name: "Tester Name", childname: "Test Child", childgrade: 5, homeaddress: "123 Test Street"}}
      expect(response).to have_http_status(:redirect)
    end
  end

end
