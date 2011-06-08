class ApplicationController < ActionController::Base
  check_authorization :unless => :devise_controller?
  protect_from_forgery

  before_filter :require_admin_for_devise_invitation
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  private
  
  def require_admin_for_devise_invitation
    if controller_name == 'invitations'
      require_admin!
    end
  end
  
  def require_admin!
    raise CanCan::AccessDenied.new("Requires admin!") unless current_user.role? :admin
  end
end
