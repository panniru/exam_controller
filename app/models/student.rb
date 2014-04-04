WillPaginate.per_page = 15
class Student < ActiveRecord::Base

  validates :roll_number, :presence => true, :uniqueness => true
  validates :name, :presence => true
  validates :dept_name, :presence => true

  belongs_to :user

  accepts_nested_attributes_for :user

  scope :search, lambda { |id| where(:id => id)}

  def self.role
    "student"
  end


end
