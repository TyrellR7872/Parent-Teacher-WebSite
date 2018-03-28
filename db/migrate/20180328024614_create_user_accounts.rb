class CreateUserAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_accounts do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :type
      t.string :name
      t.string :childname
      t.integer :childgrade
      t.string :homeaddress

      t.timestamps
    end
  end
end
