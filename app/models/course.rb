class Course < ActiveRecord::Base
  validates :name, :presence => true

  has_many :results

  scope :search, lambda { |id| where(:id => id)}
  scope :belongs_to_course, lambda { |name| where(:name => name)}
  scope :belongs_to_semester, lambda{ |sem| where(:semester => sem)}

  def self.max_no_of_subjects
    10
  end
  
  def self.grouped_courses
    Course.select(:name).group(:name)
  end

  def defined_subject_headers
    subject_headers = []
    (1..10).each do |i| 
      if self["subject_#{i}".to_sym].present?
        subject_headers << self["subject_#{i}".to_sym]
      end
    end
    subject_headers
  end



end
