class CommentsController < InheritedResources::Base
  load_and_authorize_resource
  
  actions :create, :destroy
  belongs_to :quest
  
  def create
    render :text => 'OK'
  end
  
  def destroy
    render :text => 'OK'
  end
end
