class HowTo < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true
  
  scope :search, lambda { |id| where(:id => id)}

end
