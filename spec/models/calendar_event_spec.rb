require 'rails_helper'

RSpec.describe CalendarEvent, type: :model do

  describe "check attributes and methods" do
    it "should be able to create a CalendarEvent object which has the correct methods on it" do
      event = CalendarEvent.create!(title: "Event 1", description: "Gibberish nonsensical text", date: DateTime.new(2018,9,5), location: "Huntington Gym", type: "sport", is_approved: true, contact_person: "hnguyenvu@colgate.edu")
      expect(event).to respond_to :title
      expect(event).to respond_to :date # may need start_date vs end_date
      expect(event).to respond_to :time # may need start_time vs end_time
      expect(event).to respond_to :location
      expect(event).to respond_to :description
      expect(event).to respond_to :type
      expect(event).to respond_to :contact_person
      expect(event).to respond_to :is_approved
      # expect(event).to respond_to :
      # expect(CalendarEvent).to respond_to :filter_on_constraints
    end
  end

  it "should fail to create a CalendarEvent object if the start date is not specified" do
      expect {
          CalendarEvent.create!(title: "Event 2", description: "Gibberish nonsensical text", location: "Huntington Gym", type: "sport", is_approved: true, contact_person: "hnguyenvu@colgate.edu")}.to raise_exception ActiveRecord::NotNullViolation
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
