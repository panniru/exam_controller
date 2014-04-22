class Contact < ActiveRecord::Base
  validates :designation, :presence => true
  validates :person, :presence => true
  validates :telephone, :presence => true
  validates :email, :presence => true
end
