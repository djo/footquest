module ApplicationHelper
  def user_name(user)
    "#{user.first_name} #{user.last_name}"
  end
  
  def active_on(name)
    'actve' if controller_name == name
  end
end
