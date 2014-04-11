class CreateHallOfFames < ActiveRecord::Migration
  def change
    create_table :hall_of_fames do |t|
      t.string :name
      t.string :department
      t.integer :year_of_passing
      t.string :avatar

      t.timestamps
    end
  end
end
