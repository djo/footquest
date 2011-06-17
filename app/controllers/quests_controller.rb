class QuestsController < InheritedResources::Base
  load_and_authorize_resource
  
  def create
    create! do |success, failure|
      success.html { create_users and redirect_to resource }
    end
  end
  
  private
  
  def create_users
    @quest.update_user_quests(params[:user_ids]) if params[:user_ids].present?
    true
  end
end
