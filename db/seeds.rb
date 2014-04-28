# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def seed_user
  admin = User.where(user_id: "admin").first
  # faculty = User.where(user_id: "faculty").first
  # student = Student.where(user_id: "student").first

  unless admin.present?
    admin =  User.new({:email => 'admin@test.com', :password => 'welcome', :user_id => 'admin', role: "admin"})
    admin.save!
  end
 
  # unless faculty.present?
  #   faculty =  User.new({:email => 'faculty@ostryalabs.com', :password => 'welcome', :user_id => 'faculty', role: "faculty"})
  #   faculty.save!
  # end

  # unless student.present?
  #   student =  User.new({:email => 'student@ostryalabs.com', :password => 'welcome', :user_id => 'student', role: "student"})
  #   student.save!
  # end
end

def seed_employee
  emp = Employee.first
  unless emp.present?
    emp = Employee.new(:name => "Root", :designation => "Root", :department => "Root")
    emp.save!
  end
end

def seed_results
  results = UploadPdf.first
  unless results.present?
    UploadPdf.create!(:department => "B.A")
    UploadPdf.create!(:department => "BBMT")
    UploadPdf.create!(:department => "B.Com")
    UploadPdf.create!(:department => "B.Sc")
    UploadPdf.create!(:department => "M.Sc (Chemistry)")
    UploadPdf.create!(:department => "M.Sc (Mathematics)")
    UploadPdf.create!(:department => "M.Sc (Computer Science)")
    UploadPdf.create!(:department => "MBA")
  end
end

def seed_all
  seed_user
  seed_employee
  seed_results
end


seed_all
