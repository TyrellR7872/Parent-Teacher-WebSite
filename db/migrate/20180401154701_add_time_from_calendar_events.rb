class AddTimeFromCalendarEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :calendar_events, :start_date_time, :datetime
    add_column :calendar_events, :end_date_time, :datetime
  end
end
