class CreateFacultyCourses < ActiveRecord::Migration
  def change
    create_table :faculty_courses do |t|
      t.integer :course_id
      t.integer :faculty_id

      t.timestamps
    end
  end
end
