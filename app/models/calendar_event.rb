class CalendarEvent < ApplicationRecord
  scope :event_between, -> (start_date, end_date) {where("start_date_time >= ? AND end_date_time <= ?", start_date, end_date)}

  scope :find_approved, -> (is_approved) {where("is_approved = ?", is_approved)}

  scope :approved_confirmed, -> {find_approved(true)}

  scope :approved_pending, -> {find_approved(false)}

end
