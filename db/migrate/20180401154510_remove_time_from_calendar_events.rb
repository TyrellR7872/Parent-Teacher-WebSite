class RemoveTimeFromCalendarEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :calendar_events, :start_date, :date
    remove_column :calendar_events, :start_time, :time
    remove_column :calendar_events, :end_date, :date
    remove_column :calendar_events, :end_time, :time
  end
end
