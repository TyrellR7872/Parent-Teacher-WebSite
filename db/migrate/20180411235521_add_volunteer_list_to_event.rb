class AddVolunteerListToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :calendar_events, :volunteer_list, :array
  end
end
