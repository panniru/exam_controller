module CoursesHelper

  def self.courses_belongs_user(current_user)
    s = Set.new []
    if current_user.admin?
      Course.all.each{|c| s << c.name}
    elsif current_user.faculty?
      current_user.faculty.courses.each {|c| s << c.name}
    elsif current_user.student?
      Result.belongs_to_current_user(current_user).each{ | r| s << r.course.name}
    end
    s.to_a
  end

end
