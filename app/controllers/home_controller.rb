class HomeController < ApplicationController
  skip_authorization_check
  def home_page
    @welcome = Welcome.first
    @notifications = Notification.all.order("created_at DESC") #.limit(5)
    @images = Document.where(:file_type => 'image')
  end
end
