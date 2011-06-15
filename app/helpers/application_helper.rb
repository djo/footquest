module ApplicationHelper
  def user_name(user)
    "#{user.first_name} #{user.last_name}"
  end
end
