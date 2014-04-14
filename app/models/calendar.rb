class Calendar < ActiveRecord::Base

  validates :course, :presence => true
  validates :from, :presence => true
  validates :to, :presence => true
  def self.grouped_calendars
    Calendar.select(:course).group(:course)
  end
end
