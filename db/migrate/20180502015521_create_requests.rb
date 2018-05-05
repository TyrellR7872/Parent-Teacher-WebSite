class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :requesttype
      t.string :projectname
      t.string :accounttype
      t.text :description
      t.string :datesubmit
      t.string :datemailed
      t.decimal :price, precision: 10, scale: 2
      t.string :attachments

      t.timestamps
    end
  end
end
