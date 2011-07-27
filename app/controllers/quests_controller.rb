class QuestsController < BaseSecureController
  def create
    create! do |success, failure|
      success.html { update_users and redirect_to resource }
    end
  end

  def update
    update! do |success, failure|
      success.html { update_users and redirect_to resource }
    end
  end

  private

  def update_users
    @quest.update_user_quests(params[:user_ids] || [])
    true
  end
end
