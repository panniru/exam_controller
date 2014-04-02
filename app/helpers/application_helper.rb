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

end
