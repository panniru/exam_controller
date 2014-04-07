class ResultsUploader
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include Uploader
  attr_accessor :course_name
  attr_accessor :semester
  attr_accessor :academic_year
  
  def persisted?
    false
  end

  def initialize(params = {})
    params.each{|key,val| send("#{key}=", val)}
  end

  def save
    super do |row|
      result = Result.find_by_id(row["id"]) || Result.new
      result.student = Student.find_by_roll_number(row["student_roll_no"])
      @course = load_course
      result.course = @course
      result.year = academic_year
      (1..10).each do |i| 
        if @course["subject_#{i}".to_sym].present?
          result["subject_#{i}".to_sym]  = row[@course["subject_#{i}".to_sym]]
        end
      end
      result
    end
  end

  def xls_template(options, params)
    CSV.generate(options) do |csv|
      csv << column_headers(Course.where(:name => params[:c], :semester => params[:s]).first)
    end
  end

  def load_course
    @course = @course || Course.where(:name => course_name, :semester => semester).first
  end

  def column_headers(course)
    template_headers = ["student_name", "student_roll_no"]
    (1..10).each do |i| 
      template_headers << course["subject_#{i}".to_sym] if course["subject_#{i}".to_sym].present?
    end
    template_headers
  end

end
