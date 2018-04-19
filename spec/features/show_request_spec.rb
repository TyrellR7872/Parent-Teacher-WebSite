require 'rails_helper'

describe "show page", type: :feature do
  before :each do
    CalendarEvent.create!(title: "harry potter", description: "expelliarmust", start_date_time: DateTime.new(2018,9,5.3), end_date_time: DateTime.new(2018,9,5.6), location: "The Dudley's", is_sport: true, is_approved: true, contact_person: "hnguyenvu@colgate.edu")
    CalendarEvent.create!(title: "voldermort", description: "AVADA KEDABRA", start_date_time: DateTime.new(2018,10,5.3), end_date_time: DateTime.new(2018,10,5.6), location: "under the bridge", is_sport: true, is_approved: true, contact_person: "hnguyenvu@colgate.edu")
    visit "/calendar_events"
  end

  it "should have links to each of the events" do
    expect(page).to have_link("harry potter")
    expect(page).to have_link("voldermort")
  end

  it "clicking on link for a calendar event should show details for that event" do
    click_link("harry potter")
    expect(page).to have_link("Delete event")
    expect(page).to have_content("harry potter")
    expect(page).to have_content("expelliarmust")
  end

  it "should have a link to go back to the event index page" do
    click_link("harry potter")
    expect(page).to have_link("Back to event list")
  end

  it "should have a link to edit the event" do
    click_link("harry potter")
    expect(page).to have_link("Edit event details")
  end

  it "should have a link to delete the event" do
    click_link("harry potter")
    expect(page).to have_link("Delete event")
  end

  describe "show page for about feature", type: :feature do
    before :each do
      visit "/about"
    end
    it "should show the names of Officers and Chairs of the current academic year" do
      expect(page).to have_content("Officers")
      expect(page).to have_content("Chairs")
      expect(page).to have_content("2017-2018")
    end
  end
  describe "home page", type: :feature do
    before :each do
      visit "/"
    end
    it "should show tabs for User Accounts" do
      expect(page).to have_content("User Accounts")
    end
    it "should show tabs for  Events" do
        expect(page).to have_content("Events")
    end
    it "should show a tab for About" do
      expect(page).to have_content("About")
    end
    it "should show a tab for Clubs and Organisations" do
      expect(page).to have_content("Clubs and Organisations")
    end
  end
end
