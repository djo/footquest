class ApplicationController < ActionController::Base
  check_authorization :unless => :devise_controller?
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  private
  
  def require_admin!
    raise CanCan::AccessDenied.new("Requires admin!") unless current_user.try(:role?, :admin)
  end
end
