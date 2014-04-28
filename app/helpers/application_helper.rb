module ApplicationHelper
    def self.btn_group(links)
    btn_group = "<div class='btn-group'>"
    btn_group += "#{links[0] }"
    links.delete_at(0)
    btn_group += "<button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown'><span class='caret'></span><span class='sr-only'>Toggle Dropdown</span></button>"
    btn_group += "<ul class='dropdown-menu' role='menu>"
    btn_group += "<li></li>"
    btn_group += "<li class='divider'></li>"
    links.each do |link|
      btn_group += "<li>#{link}</li>"
      btn_group += "<li class='divider'></li>"
    end
    btn_group += "</ul>"
    btn_group += "</div>"
  end

  def flash_alert_class(key)
    key = 'danger' if key == :error or key == :alert
    alert_class = ["alert"]
    if key.to_s == "fail"
      alert_class << "alert-danger"
    elsif key == :notice
      alert_class << "alert-info"
    else
      alert_class << "alert-#{key}"
    end
    alert_class.join(" ")
  end

  def navigation_left
    list = []
    if current_user.present? and current_user.admin?
      if controller.controller_name == "students"
        list << Struct.new(:item, :class, :link).new("Students", "active", students_path)
      elsif controller.controller_name == "faculties"
        list << Struct.new(:item, :class, :link).new("Faculties", "active", faculties_path)
      elsif controller.controller_name == "courses"
        list << Struct.new(:item, :class, :link).new("Departments", "active", courses_path)
      elsif controller.controller_name == "results"
        list << Struct.new(:item, :class, :link).new("Results", controller.action_name != "result_upload"? "active" : "", results_path)
        list << Struct.new(:item, :class, :link).new("Upload Results", controller.action_name == "result_upload"? "active" : "", result_upload_results_path)
      end
    elsif current_user.present? and current_user.faculty? and controller.controller_name == "results"
      list << Struct.new(:item, :class, :link).new("Results", controller.action_name != "result_upload"? "active" : "", results_path)
      list << Struct.new(:item, :class, :link).new("Upload Results", controller.action_name == "result_upload"? "active" : "", result_upload_results_path)
    elsif current_user.present? and current_user.student? and controller.controller_name == "results"
      list << Struct.new(:item, :class, :link).new("Results", controller.action_name != "result_upload"? "active" : "", results_path)
    end
    list
  end

  def navigation_present?
    current_user.present? and (controller.controller_name == "students" or controller.controller_name == "courses" or controller.controller_name == "results" or controller.controller_name == "faculties")
  end


end
