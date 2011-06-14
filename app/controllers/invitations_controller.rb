class InvitationsController < ApplicationController
  skip_authorization_check
  
  before_filter :require_admin!
  before_filter :build_user, :only => :create
  
  def new
    @user = User.new
  end

  def create
    if @user.update_attributes(params[:user])
      UserMailer.invitation_email(@user).deliver
      redirect_to root_url, :notice => 'Приглашение отослано'
    else
      render :new
    end
  end

  private
  
  def build_user
    @user = User.new
    @user.accessible = current_user.role
    @user.password = Digest::SHA1.hexdigest(Time.now.to_s)[0,8]
    @user.password_confirmation = @user.password
  end
end
