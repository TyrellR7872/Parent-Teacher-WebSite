class CreateCalendarEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :calendar_events do |t|
      t.text :title
      t.text :description
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.text :location
      t.boolean :is_sport
      t.boolean :is_musical
      t.boolean :is_meeting
      t.boolean :is_charity
      t.boolean :is_approved
      t.boolean :is_gathering
      t.boolean :is_optional
      t.boolean :for_teacher
      t.boolean :for_parent
      t.boolean :for_student
      t.boolean :for_family
      t.boolean :for_elementary_student
      t.boolean :for_highschool_student
      t.text :contact_person

      t.timestamps
    end
  end
end
