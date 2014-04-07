class Calendar < ActiveRecord::Base
def self.grouped_calendars
  Calendar.select(:course).group(:course)
end
end
