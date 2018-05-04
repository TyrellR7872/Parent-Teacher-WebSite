class AddAttachmentImageToCalendarEvents < ActiveRecord::Migration[5.1]
  def self.up
    change_table :calendar_events do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :calendar_events, :image
  end
end
