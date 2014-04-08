class HomeController < ApplicationController
  skip_authorization_check
  def home_page
    @welcome = Welcome.first
  end
end
