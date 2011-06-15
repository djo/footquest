class UsersController < InheritedResources::Base
  load_and_authorize_resource
  
  before_filter :build_user, :only => :create

  private
  
  def build_user
    @user = User.new
    @user.accessible = current_user.role
    @user.attributes = params[:user]
    @user.password = Digest::SHA1.hexdigest(Time.now.to_s)[0,8]
    @user.password_confirmation = @user.password
  end
end
