module QuestsHelper
  def build_user_quests
    User.all.map { |u| UserQuest.new(:user => u) }
  end
  
  def user_quest_check_box(form, quest)
    form.check_box :user_id, { :checked => quest.users.include?(form.object.user) }, form.object.user_id, nil
  end
end
