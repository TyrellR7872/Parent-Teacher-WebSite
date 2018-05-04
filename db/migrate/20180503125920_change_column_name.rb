class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :requests, :requesttype, :funding
  end
end
