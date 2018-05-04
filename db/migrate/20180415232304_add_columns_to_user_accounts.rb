class AddColumnsToUserAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :user_accounts, :accounttype, :string, default: ""
    add_column :user_accounts, :name, :string, default: ""
    add_column :user_accounts, :homeaddress, :string, default: ""
    add_column :user_accounts, :childname, :string, default: ""
    add_column :user_accounts, :childgrade, :integer, default: ""
  end
end
