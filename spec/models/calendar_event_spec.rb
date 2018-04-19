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
  # describe "check scope approved_pending" do
  #   it "should return the correct approved_pending events" do
  #     expect {CalendarEvent.approved_pending}.to
  #   end
  # end

end
