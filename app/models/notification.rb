class Notification < ActiveRecord::Base
  validates :event, :presence => true
  validates :description, :presence => true

end
