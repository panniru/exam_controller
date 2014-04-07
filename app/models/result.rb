class Result < ActiveRecord::Base
  validates :year, :presence => true
  
  attr_accessor :course_name
  attr_accessor :semester

  scope :belongs_to_year, lambda{|year| where(:year => year)}
  scope :belongs_to_current_user, lambda{ |user|
    if user.role == 'student'
      where(:student_id => user.resource_id)
    end
  }
  
  belongs_to :student
  belongs_to :course
  
  
end
