class UsersController < BaseSecureController
  before_filter :build_user, :only => :create

  def create
    create! do |success, failure|
      success.html { send_invitation and redirect_to(users_url, :notice => 'Приглашение отослано') }
    end
  end

  private

  def build_user
    @user = User.new
    @user.accessible = current_user.role
    @user.attributes = params[:user]
    @user.password = Digest::SHA1.hexdigest(Time.now.to_s)[0,8]
    @user.password_confirmation = @user.password
  end

  def send_invitation
    UserMailer.invitation_email(@user).deliver
  end
end
