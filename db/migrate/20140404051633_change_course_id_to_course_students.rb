class ChangeCourseIdToCourseStudents < ActiveRecord::Migration
  def change
    add_column :students, :dept_name, :string
    remove_column :students, :course_id, :integer
  end
end
