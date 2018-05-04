class CreateChildren < ActiveRecord::Migration[5.1]
  def change
    create_table :children do |t|
      t.references :user_account, foreign_key: true
      t.timestamps
    end
  end
end
