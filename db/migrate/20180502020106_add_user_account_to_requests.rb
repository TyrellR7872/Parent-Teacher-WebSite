class AddUserAccountToRequests < ActiveRecord::Migration[5.1]
  def change
    add_reference :requests, :user_account, foreign_key: true
  end
end
