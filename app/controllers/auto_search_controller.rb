class AutoSearchController < ApplicationController
  skip_authorization_check

  autocomplete :course, :name, :full => true
  autocomplete :how_to, :name, :full => true
  autocomplete :faculty, :name, :full => true
  autocomplete :document,:filename, :full => true
  autocomplete :calendar, :course, :full => true

  def autocomplete_student_by_roll_no_and_name
    term = params[:term]
    students = Student.where("lower(roll_number) ILIKE '%#{term}%' OR lower(name) ILIKE '%#{term}%'").order(:name)
    render :json => students.map { |student| {:id => student.id, :label => student.name, :value => student.name} }
  end


end
