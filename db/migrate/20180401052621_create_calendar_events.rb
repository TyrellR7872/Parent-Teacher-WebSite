class CreateCalendarEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :calendar_events do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.datetime :start_date_time, null: false
      t.datetime :end_date_time, null: false
      t.text :location, null: false
      t.boolean :is_sport
      t.boolean :is_musical
      t.boolean :is_meeting
      t.boolean :is_charity
      t.boolean :is_approved, null: false
      t.boolean :is_gathering
      t.boolean :is_optional
      t.boolean :for_teacher
      t.boolean :for_parent
      t.boolean :for_student
      t.boolean :for_family
      t.boolean :for_elementary_student
      t.boolean :for_highschool_student
      t.text :contact_person, null: false

      t.timestamps
    end
  end
end
