module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      
      @user = Factory.build :user
      @user.role = 'admin'
      @user.save!
      
      sign_in @user
    end
  end
  
  # Admin's macroses
  # ---------------------------------------------------
  def should_allow_only_admins(&block)
    it "should be only admin and moderator roles" do
      User::ROLES.should == ['admin', 'moderator']
    end

    it "should deny unauthenticated user" do
      sign_out @user if @user

      instance_eval &block
      response.should redirect_to(root_url)
      flash[:alert].should == "You are not authorized to access this page."
    end

    it "should deny moderator user" do
      sign_out @user if @user
      sign_in Factory(:user) # moderator user

      instance_eval &block
      response.should redirect_to(root_url)
      flash[:alert].should == "You are not authorized to access this page."
    end

    it "should allow admin user" do
      admin = Factory.build :user
      admin.role = 'admin'
      admin.save!
      
      sign_out @user if @user
      sign_in admin

      instance_eval &block
      response.should_not redirect_to(root_url)
    end
  end

  def should_allow_only_admins_to(actions, resource = nil)
    check_resource :should_allow_only_admins, actions, resource
  end

  # Moderator's macroses
  # ---------------------------------------------------
  
  # Unauthenticated User's macroses
  # ---------------------------------------------------
  def should_deny_unauthenticated_users(&block)
    it "should deny unauthenticated user" do
      sign_out @user if @user

      instance_eval &block
      response.should redirect_to(root_url)
      flash[:alert].should == "You are not authorized to access this page."
    end
  end
  
  def should_deny_unauthenticated_users_to(actions, resource = nil)
    check_resource :should_deny_unauthenticated_users, actions, resource
  end
  
  private
  
  def check_resource(macros, actions, resource = nil)
    actions.each do |action|
      if [:index, :new].include?(action)
        send(macros) { get action }
      elsif :create == action
        send(macros) { post action }
      elsif [:show, :edit].include?(action)
        send(macros) { get action, :id => resource.to_param }
      elsif :update == action
        send(macros) { put action, :id => resource.to_param }
      elsif :destroy == action
        send(macros) { delete action, :id => resource.to_param }
      else
        raise "Not supported action"
      end
    end
  end
end
