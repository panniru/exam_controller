class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :event
      t.string :description

      t.timestamps
    end
  end
end
