class HomeController < ApplicationController
  def index
    @calendar_events = CalendarEvent.approved_upcoming(4); # can be nil
    # current_user_account.update_attribute(:admin, true) if !current_user_account.nil?
  end
end
