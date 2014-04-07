class RemoveStudentDetailsFromResults < ActiveRecord::Migration
  def change
    remove_column :results, :student_name, :string
    remove_column :results, :student_roll_no, :string
    add_column :results, :student_id, :integer
  end
end
