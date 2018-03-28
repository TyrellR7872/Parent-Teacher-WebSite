class CreateCalendarEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :calendar_events do |t|
      t.string :title
      t.date :date
      t.time :time
      t.text :location
      t.text :description
      t.string :type
      t.text :contact_person
      t.boolean :is_approved

      t.timestamps
    end
  end
end
