class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :student_name
      t.string :student_roll_no
      t.string :course
      t.string :semester
      t.float :subject_1
      t.float :subject_2
      t.float :subject_3
      t.float :subject_4
      t.float :subject_5
      t.float :subject_6
      t.float :subject_7
      t.float :subject_8
      t.float :subject_9
      t.float :subject_10
      t.integer :year

      t.timestamps
    end
  end
end
