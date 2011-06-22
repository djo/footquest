module ApplicationHelper
  def user_name(user)
    "#{user.first_name} #{user.last_name}"
  end
  
  def active_on(name)
    'active' if controller_name == name
  end
  
  # Adds custom stylesheet from a template
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  # Adds custom javascript file from a template
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
end
