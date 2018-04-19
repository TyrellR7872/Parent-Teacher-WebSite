class AddVolunteerListToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :calendar_events, :volunteers, foreign_key: true
  end
end
