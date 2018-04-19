class HomeController < ApplicationController
  def index
    @calendar_events = CalendarEvent.approved_upcoming(4); # can be nil
  end
end
