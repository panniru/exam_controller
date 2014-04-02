class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.date :dob
      t.date :joining_date
      t.integer :course_id
      t.string :roll_number
      t.integer :user_id

      t.timestamps
    end
  end
end
