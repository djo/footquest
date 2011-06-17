module QuestsHelper
  def available_organizers
    User.all
  end
  
  def include_organizer?(quest, user)
    if params[:user_ids].present?
      params[:user_ids].include? user.id.to_s
    else
      quest.user_ids.include? user.id
    end
  end
end
