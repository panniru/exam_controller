class RemoveCourseDetailsFromResults < ActiveRecord::Migration
  def change
    remove_column :results, :course, :string
    remove_column :results, :semester, :string
    add_column :results, :course_id, :integer
  end
end
