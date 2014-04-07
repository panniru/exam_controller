class ApplicationController < ActionController::Base
  #before_action :authenticate_user!, :unless => :devise_controller? #"HomeController"

  before_action :store_location
  before_action :set_gon_data
  #check_authorization :unless => :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def set_gon_data
    gon.user_role = current_user.role if current_user.present?
  end
  
  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if (request.fullpath != "/users/sign_in" &&
        request.fullpath != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end


  private
  
  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

end
