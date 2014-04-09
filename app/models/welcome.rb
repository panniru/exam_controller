class Welcome < ActiveRecord::Base

  validates :heading, :presence => true
  validates :message, :presence => true

end
