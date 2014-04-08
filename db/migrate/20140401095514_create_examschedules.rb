class CreateExamschedules < ActiveRecord::Migration
  def change
    create_table :examschedules do |t|
      t.string :event
      t.string :courses
      t.string :subjects
      t.string :academic_year
      t.integer :date
      t.integer :timings

      t.timestamps
    end
  end
end
