class CalendarEvent < ApplicationRecord
  scope :event_between, -> (start_date, end_date) {where("start_date_time >= ?", start_date).where( "end_date_time <= ?", end_date)}

  scope :find_approved, -> (is_approved) {where("is_approved = ?", is_approved)}

  scope :approved_confirmed, -> {find_approved(true)}

  scope :approved_pending, -> {find_approved(false)}

  def start_date
    self.start_date_time.to_date
  end

  def end_date
    self.end_date_time.to_date
  end

  def start_time
    self.start_date_time.strftime('%l.%M %p')
  end

  def end_time
    self.end_date_time.strftime('%l.%M %p')
  end

end
