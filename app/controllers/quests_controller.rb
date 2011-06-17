class QuestsController < InheritedResources::Base
  load_and_authorize_resource
  
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
    @quest.update_user_quests(params[:user_ids]) if params[:user_ids].present?
    true
  end
end
