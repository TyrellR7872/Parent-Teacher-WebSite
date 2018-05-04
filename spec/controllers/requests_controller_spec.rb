require 'rails_helper'

RSpec.describe RequestsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    login_user

    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    login_user

    it "returns http success" do
      request = Request.create!(funding: true, projectname: "Test Project", description: "For testing purposes", price: 50, students: 500, user_account_id: subject.current_user_account.id)
      get :show, :params => {:id => request}
      expect(response).to have_http_status(:success)
    end
  end


end
