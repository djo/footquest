class CommentsController < InheritedResources::Base
  load_and_authorize_resource
  
  actions :create, :destroy
  belongs_to :quest
  
  layout false
  
  def create
    create! do |success, failure|
      success.html { render :create }
      failure.html { render :errors, :status => :bad_request }
    end
  end
  
  def destroy
    create! do |success, failure|
      success.html { render :text => 'OK' }
      failure.html { render :text => 'FAIL', :status => :bad_request  }
    end
  end
end
