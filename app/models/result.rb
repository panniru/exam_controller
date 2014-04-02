class Result < ActiveRecord::Base
  validates :student_name, :presence => true
  validates :student_roll_no, :presence => true
  validates :course, :presence => true
  validates :semester, :presence => true
  validates :year, :presence => true
  
end
