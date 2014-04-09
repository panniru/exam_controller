class Calendar < ActiveRecord::Base

	#validates :course, :presence => true,

	def self.grouped_calendars
  	Calendar.select(:course).group(:course)
	end
end
