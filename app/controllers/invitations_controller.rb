class InvitationsController < ApplicationController
  skip_authorization_check
  before_filter :require_admin!
  
  def new
  end

  def create
  end

end
