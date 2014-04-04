class Course < ActiveRecord::Base
  validates :name, :presence => true
  scope :search, lambda { |id| where(:id => id)}

  def self.grouped_courses
    Course.select(:name).group(:name)
  end

end
