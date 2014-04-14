class RemoveResourceIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :resource_id, :integer
  end
end
