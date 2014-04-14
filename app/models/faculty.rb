class Faculty < ActiveRecord::Base

  validates :name, :presence => true
  after_save :insert_faculty_course

  belongs_to :user, :dependent => :destroy
  accepts_nested_attributes_for :user

  attr_accessor :department_names
  has_many :courses, :through => :faculty_courses
  has_many :faculty_courses
  has_many :exams

  scope :search, lambda { |id| where(:id => id)}

  def selected_courses
    if self.courses.present?
      courses.map{|c| c.name }
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
      courses = self.courses.map{ |c| c.name}
    end
    department_names.delete("")
    courses.each do |c|
      unless department_names.delete(c)
        unlink_courses << c
      end
    end
    active_courses = Course.where(:name => department_names).map{ |dept| {:faculty_id => self.id, :course_id => dept.id} }
    unless active_courses.empty?
      unless FacultyCourse.create(active_courses)
        self.errors.add :base, fc.errors.full_messages.first
        raise ActiveRecord::Rollback
      end
    end
    unless unlink_courses.empty?
      ids = Course.where(:name => unlink_courses).map{ |dept| dept.id}
      unless FacultyCourse.where(:course_id => ids, :faculty_id => self.id).destroy_all
        self.errors.add :base, fc.errors.full_messages.first
        raise ActiveRecord::Rollback
      end
    end
  end

end
