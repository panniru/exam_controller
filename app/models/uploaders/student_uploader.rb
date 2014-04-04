class StudentUploader
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include Uploader
  attr_accessor :dept_name

  def persisted?
    false
  end

  def initialize(params = {})
    super(params[:file])
    self.dept_name = params[:dept_name]
  end

  def save
    super do |row|
      student = Student.find_by_id(row["id"]) || Student.new
      student.attributes = row.to_hash.slice("name", "dob", "joining_date", "roll_number")
      student.dept_name = dept_name
      user = student.build_user
      user.attributes = {:email => row["email"], :user_id => student.roll_number.to_s, :password => "welcome", :password_confirmation => "welcome", :role => Student.role }
      student

    end
  end

  def xls_template(options)
    template_headers = ["roll_number", "name", "dob", "joining_date", "email"]
    CSV.generate(options) do |csv|
      csv << template_headers
    end
  end

end
