class Course < ActiveRecord::Base
  validates :name, :presence => true
  scope :search, lambda { |id| where(:id => id)}
end
