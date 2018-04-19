class CreateJoinTableEventsUsers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :calendar_events, :user_accounts do |t|
       # t.index [:calendar_event_id, :user_account_id]
       # t.index [:user_account_id, :calendar_event_id]
    end
  end
end
