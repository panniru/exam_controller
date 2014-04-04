class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:user_id]
  
  validates :user_id, :presence => true, :uniqueness => true
  
  has_one :student
  has_one :faculty
  
  def self.search(id)
    self.where(:id => id)
  end

  def admin?
    self.role == 'admin'
  end

  def faculty?
    self.role == 'faculty'
  end

  def student?
    self.role == 'student'
  end

  def resource
    if student?
      student
    elsif faculty?
      faculty
    end
  end

  def exams
    resource.exams
  end

end
