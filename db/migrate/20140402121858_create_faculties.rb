class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :name
      t.string :designation
      t.integer :user_id

      t.timestamps
    end
  end
end
