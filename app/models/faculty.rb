class Faculty < ActiveRecord::Base

  validates :name, :presence => true
  after_save :insert_faculty_course

  belongs_to :user
  accepts_nested_attributes_for :user

  attr_accessor :department_ids
  has_many :courses, :through => :faculty_courses
  has_many :faculty_courses
  has_many :exams

  scope :search, lambda { |id| where(:id => id)}

  def selected_courses
    if self.courses.present?
      courses.map{|c| c.course.name }
    else
      []
    end
  end

  def course_names
    courses.map{|c| c.name}.join(", ")
  end

  def self.role
    "faculty"
  end

  private

  def insert_faculty_course
    courses = []
    unlink_courses = []
    if self.courses.present?
      courses = self.courses.map{ |c| c.course.name}
    end
    department_ids.delete("")
    courses.each do |id|
      unless department_ids.delete(id.to_s)
        unlink_courses << id.to_s
      end
    end
    active_courses = department_ids.map{ |dept| {:faculty_id => self.id, :course_id => dept} }

    unless active_courses.empty?
      unless FacultyCourse.create(active_courses)
        self.errors.add :base, fc.errors.full_messages.first
        raise ActiveRecord::Rollback
      end
    end

    unless unlink_courses.empty?
      unless FacultyCourse.where(:course_id => unlink_courses, :faculty_id => self.id).destroy_all
        self.errors.add :base, fc.errors.full_messages.first
        raise ActiveRecord::Rollback
      end
    end
  end

end
