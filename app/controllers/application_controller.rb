class ApplicationController < ActionController::Base
  check_authorization :unless => :devise_controller?
  protect_from_forgery
end
