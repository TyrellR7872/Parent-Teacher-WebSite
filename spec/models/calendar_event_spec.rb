require 'rails_helper'

RSpec.describe CalendarEvent, type: :model do
  describe "check attributes and methods" do
    it "should be able to create a CalendarEvent object which has the correct methods on it" do
      event = CalendarEvent.create!(title: "Event 1", description: "Gibberish nonsensical text", start_date_time: DateTime.new(2018,9,5.3), end_date_time: DateTime.new(2018,9,5.6), location: "Huntington Gym", is_sport: true, is_approved: true, contact_person: "hnguyenvu@colgate.edu")
      expect(event).to respond_to :title
      expect(event).to respond_to :start_date_time
      expect(event).to respond_to :location
      expect(event).to respond_to :description
      expect(event).to respond_to :is_sport
      expect(event).to respond_to :is_musical
      expect(event).to respond_to :is_meeting
      expect(event).to respond_to :is_charity
      expect(event).to respond_to :is_gathering
      expect(event).to respond_to :is_optional
      expect(event).to respond_to :for_teacher
      expect(event).to respond_to :for_parent
      expect(event).to respond_to :for_elementary_student
      expect(event).to respond_to :for_highschool_student
      expect(event).to respond_to :contact_person
      expect(event).to respond_to :is_approved
    end
  end

  describe "check failure of creating when mandatory fields are nil" do
    it "should fail to create a CalendarEvent object if the start date time is not specified" do
        expect {
            CalendarEvent.create!(title: "Start Date Time Nil Test", description: "Gibberish nonsensical text", end_date_time: DateTime.new(2018,9,5.9), location: "Huntington Gym", is_sport: true, is_approved: true, contact_person: "hnguyenvu@colgate.edu")}.to raise_exception ActiveRecord::NotNullViolation
    end

    it "should fail to create a CalendarEvent object if the end date time is not specified" do
        expect {
            CalendarEvent.create!(title: "End Date Time Nil Test", description: "Gibberish nonsensical text", start_date_time: DateTime.new(2018,9,5.9), location: "Huntington Gym", is_sport: true, is_approved: true, contact_person: "hnguyenvu@colgate.edu")}.to raise_exception ActiveRecord::NotNullViolation
    end

    it "should fail to create a CalendarEvent object if the location is not specified" do
        expect {
            CalendarEvent.create!(title: "Location Nil Test", description: "Gibberish nonsensical text", start_date_time: DateTime.new(2018,9,5.7), end_date_time: DateTime.new(2018,9,5.9), is_sport: true, is_approved: true, contact_person: "hnguyenvu@colgate.edu")}.to raise_exception ActiveRecord::NotNullViolation
    end

    it "should fail to create a CalendarEvent object if the contact person is not specified" do
        expect {
            CalendarEvent.create!(title: "Contact Person Nil Test", description: "Gibberish nonsensical text", location: "Huntington Gym", start_date_time: DateTime.new(2018,9,5.7), end_date_time: DateTime.new(2018,9,5.9), is_sport: true, is_approved: true)}.to raise_exception ActiveRecord::NotNullViolation
    end

    it "should fail to create a CalendarEvent object if the status of being approved is not specified" do
        expect {
            CalendarEvent.create!(title: "Approved Nil Test", description: "Gibberish nonsensical text", location: "Huntington Gym", start_date_time: DateTime.new(2018,9,5.5), end_date_time: DateTime.new(2018,9,5.7), is_sport: true, contact_person: "hnguyenvu@colgate.edu")}.to raise_exception ActiveRecord::NotNullViolation
    end

    it "should fail to create a CalendarEvent object if the title is not specified" do
      expect {
        CalendarEvent.create!(description: "Gibberish nonsensical text", location: "Huntington Gym", start_date_time: DateTime.new(2018,9,5.4), end_date_time: DateTime.new(2018,9,5.6), is_sport: true, is_approved: true, contact_person: "hnguyenvu@colgate.edu")
      }.to raise_exception ActiveRecord::NotNullViolation
    end
  end

  # TODO Need to add test for the new scope
  describe "check scope in CalendarEvent" do
    before(:example) do
      CalendarEvent.create!(title: "harry potter", description: "expelliarmust", start_date_time: DateTime.new(2017,9,5.3), end_date_time: DateTime.new(2017,9,5.6), location: "The Dudley's", is_sport: true, is_approved: true, contact_person: "hnguyenvu@colgate.edu")
      CalendarEvent.create!(title: "voldermort", description: "AVADA KEDABRA", start_date_time: DateTime.new(2018,10,5.3), end_date_time: DateTime.new(2018,10,5.6), location: "under the bridge", is_sport: true, is_approved: true, contact_person: "hnguyenvu@colgate.edu")
      CalendarEvent.create!(title: "dumbledore", description: "i don't have time Severus", start_date_time: DateTime.new(2018,10,5.3), end_date_time: DateTime.new(2018,10,5.6), location: "hogwarts", is_sport: false, is_approved: true, contact_person: "hnguyenvu@colgate.edu")
      CalendarEvent.create!(title: "severus snape", description: "After all this time? Always.", start_date_time: DateTime.new(2018,10,5.3), end_date_time: DateTime.new(2018,10,5.6), location: "in the pensieve", is_sport: false, is_approved: true, contact_person: "hnguyenvu@colgate.edu")
      CalendarEvent.create!(title: "dummy 1", description: "namnamnamanmanamanam", start_date_time: DateTime.new(2019,10,5.3), end_date_time: DateTime.new(2019,10,5.6), location: "dummy dummy", is_sport: false, is_approved: true, contact_person: "hnguyenvu@colgate.edu")
      CalendarEvent.create!(title: "dummy 2", description: "namnamnamanmanamanam", start_date_time: DateTime.new(2019,10,5.3), end_date_time: DateTime.new(2019,10,5.6), location: "dummy dummy", is_sport: false, is_approved: false, contact_person: "hnguyenvu@colgate.edu")
      CalendarEvent.create!(title: "dummy 3", description: "namnamnamanmanamanam", start_date_time: DateTime.new(2019,10,5.3), end_date_time: DateTime.new(2019,10,5.6), location: "dummy dummy", is_sport: false, is_approved: false, contact_person: "hnguyenvu@colgate.edu")
      CalendarEvent.create!(title: "dummy 4", description: "namnamnamanmanamanam", start_date_time: DateTime.new(2019,12,5.3), end_date_time: DateTime.new(2019,12,5.6), location: "dummy dummy", is_sport: false, is_approved: true, contact_person: "hnguyenvu@colgate.edu")
      CalendarEvent.create!(title: "dummy 5", description: "namnamnamanmanamanam", start_date_time: DateTime.new(2014,12,5.3), end_date_time: DateTime.new(2014,12,5.6), location: "dummy dummy", is_sport: false, is_approved: true, contact_person: "hnguyenvu@colgate.edu")
    end

    it "should return the correct number of approved_pending events" do
      event = CalendarEvent.approved_pending
      expect(event.length).to eq(2)
    end

    it "should return the correct number of approved_confirmed events" do
      event = CalendarEvent.approved_confirmed
      expect(event.length).to eq(7)
    end

    it "should return the correct number of future_event events" do
      allow(DateTime).to receive(:now).and_return(DateTime.new(2018,9,5))
      event = CalendarEvent.future_event
      expect(event.length).to eq(7)
    end

    it "should return the correct number of approved_upcoming events" do
      allow(DateTime).to receive(:now).and_return(DateTime.new(2018,9,5))
      event = CalendarEvent.approved_upcoming(5)
      expect(event.length).to eq(5)
      allow(DateTime).to receive(:now).and_return(DateTime.new(2019,9,5))
      event = CalendarEvent.approved_upcoming(5)
      expect(event.length).to eq(2)
    end
  end

end
