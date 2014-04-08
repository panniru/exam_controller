WillPaginate.per_page = 15
class Feedback < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true
  
  scope :dated_on, lambda{|date| where(" created_at >= ?", Date.parse(date))}

end
