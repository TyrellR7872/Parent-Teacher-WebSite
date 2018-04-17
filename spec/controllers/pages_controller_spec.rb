
require 'rails_helper'

RSpec.describe PagesController, type: :controller do

end

require 'rails_helper'


RSpec.describe PagesController, type: :controller do

  describe "GET #show for the About page" do
    it "returns http success" do
      get :show, params: {:id => 'about'}
      expect(response).to have_http_status(:success)
    end
    it "should display the names of officers and chairs" do
      get :show, params: {:id => 'about'}
    end
  end

  describe "GET #show for the Clubs and Organizations page" do
    it "returns http success" do
      get :show, params: {:id => 'clubs'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show for non-existent page" do
    it "returns http failure" do
      get :show, params: {:id => 'this_is_a_non_existent_page'}
      expect(response).to have_http_status(:not_found)
    end
  end

end
