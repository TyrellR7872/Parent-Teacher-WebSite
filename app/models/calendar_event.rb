class CalendarEvent < ApplicationRecord
  scope :event_between, ->(start_date, end_date){where("start_date_time >= ? AND end_date_time <= ?", start_date, end_date)}
end
