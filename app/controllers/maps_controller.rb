class MapsController < InheritedResources::Base
  belongs_to :quest, :singleton => true
  
  actions :show, :update
  
  before_filter :check_permissions

  private
  
  def check_permissions
    authorize! :update, parent
  end
end
