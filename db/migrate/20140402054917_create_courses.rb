class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :semester
      t.string :subject_1
      t.string :subject_2
      t.string :subject_3
      t.string :subject_4
      t.string :subject_5
      t.string :subject_6
      t.string :subject_7
      t.string :subject_8
      t.string :subject_9
      t.string :subject_10

      t.timestamps
    end
  end
end
