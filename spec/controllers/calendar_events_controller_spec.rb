require 'rails_helper'


RSpec.describe CalendarEventsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create, params: {:calendar_event => { title: "Samite", description: "East African music", start_date_time: DateTime.new(2018,9,5.9), end_date_time: DateTime.new(2018,9,5.9), location: "Chapel", is_musical: true, is_approved: true, contact_person: "ajamil@colgate.edu" }}
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #update" do
    # before(:example) do
    #   CalendarEvent.create!(title: "Nerd Nite", description: "Board game fun", start_date_time: DateTime.new(2018,9,5.9), end_date_time: DateTime.new(2018,9,5.9), location: "Donovan's Pub", is_approved: true, contact_person: "ajamil@colgate.edu")
    # end
    it "returns http success" do
      CalendarEvent.create!(title: "Nerd Nite", description: "Board game fun", start_date_time: DateTime.new(2018,9,5.9), end_date_time: DateTime.new(2018,9,5.9), location: "Donovan's Pub", is_approved: true, contact_person: "ajamil@colgate.edu")
      get :update, params: {:id => 1, :calendar_event => { title: "Nerf Nite", description: "Nerf gun warfare", start_date_time: DateTime.new(2018,9,5.9), end_date_time: DateTime.new(2018,9,5.9), location: "Huntington Gym", is_sport: true, is_approved: true, contact_person: "ajamil@colgate.edu" }}
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "bad paths for create/update" do
    it "should redirect to new on create failure" do
      p = CalendarEvent.new(title: "Internet Gamers", description: "1v1 tournament", start_date_time: DateTime.new(2018,9,5.9), end_date_time: DateTime.new(2018,9,5.9), location: "Cronin room", is_sport: true, is_approved: true, contact_person: "ajamil@colgate.edu")
      expect(CalendarEvent).to receive(:new) { p }
      expect(p).to receive(:save) { nil }
      post :create, params: {:calendar_event => { title: "Internet Gamers", description: "2v2 tournament", start_date_time: DateTime.new(2018,9,5.9), end_date_time: DateTime.new(2018,9,5.9), location: "Cronin room", is_sport: true, is_approved: true, contact_person: "ajamil@colgate.edu" }}
      expect(response).to redirect_to(new_calendar_event_path)
    end

    it "should redirect to show on update failure" do
      p =   CalendarEvent.create!(title: "Japan festival", description: "Fun games and Japanese food", location: "ALANA", start_date_time: DateTime.new(2018,9,5.7), end_date_time: DateTime.new(2018,9,5.9), is_approved: true, contact_person: "ajamil@colgate.edu")
      expect(CalendarEvent).to receive(:find) { p }
      expect(p).to receive(:update) {p}
      expect(p).to receive(:save) { nil }
      post :update, params: {:id => 1, :calendar_event => { title: "Japan festival", description: "Fun games and Japanese food", start_date_time: DateTime.new(2018,9,5.9), location: "OISS kitchen", is_approved: true, contact_person: "ajamil@colgate.edu" }}
      expect(response).to redirect_to(edit_calendar_event_path(p))
    end

  end

end
