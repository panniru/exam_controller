class ResultsUploader
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include Uploader
  attr_accessor :course_id
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
      puts "================>#{row.inspect}"
      @course = load_course
      (1..10).each do |i| 
        if @course["subject_#{i}".to_sym].present?
          p row[@course["subject_#{i}".to_sym]]
          result["subject_#{i}".to_sym]  = row[@course["subject_#{i}".to_sym]]
        end
      end
      puts "================>#{result.inspect}"
      result
    end
  end

  def xls_template(options, course_id)

    CSV.generate(options) do |csv|
      csv << column_headers(Course.find(course_id))
    end
  end

  def load_course
    @course = @course || Course.find(course_id)
  end

  def column_headers(course)
    template_headers = ["student_name", "student_roll_no", "course", "semester", "year"]
    (1..10).each do |i| 
      template_headers << course["subject_#{i}".to_sym] if course["subject_#{i}".to_sym].present?
    end
    template_headers
  end

end
