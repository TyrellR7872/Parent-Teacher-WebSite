class AddColumnsToChildren < ActiveRecord::Migration[5.1]
  def change
    add_column :children, :childname, :string, default:""
    add_column :children, :childgrade, :integer, default:""
    add_column :children, :number_of_children, :integer, default:""
  end
end
