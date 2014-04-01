class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :designation
      t.string :department
      t.integer :manager

      t.timestamps
    end
  end
end
