class AddStudentsToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :students, :integer
  end
end
