class AddAdminToUserAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :user_accounts, :admin, :boolean, default: false
  end
end
