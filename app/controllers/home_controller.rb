class HomeController < ApplicationController
  def index
    @calendar_events = CalendarEvent.approved_upcoming(5); # can be nil
  end
end
