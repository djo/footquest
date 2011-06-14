module ControllerMacros
  def should_deny_unauthenticated_users(&block)
    it "should deny unauthenticated user" do
      sign_out @user if @user

      instance_eval &block
      response.should redirect_to(root_url)
      flash[:alert].should == "You are not authorized to access this page."
    end
  end
  
  def should_allow_only_admin(&block)
    it "should be only admin and moderator roles" do
      User::ROLES.should == ['admin', 'moderator']
    end

    it "should deny unauthenticated user" do
      sign_out @user if @user

      instance_eval &block
      response.should redirect_to(root_url)
      flash[:alert].should == "Requires admin!"
    end

    it "should deny moderator user" do
      sign_out @user if @user
      sign_in Factory(:user) # moderator user

      instance_eval &block
      response.should redirect_to(root_url)
      flash[:alert].should == "Requires admin!"
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
  
  def should_deny_unauthenticated_users_to(actions, resource = nil)
    actions.each do |action|
      if [:index, :new].include?(action)
        should_deny_unauthenticated_users { get action }
      elsif :create == action
        should_deny_unauthenticated_users { post action }
      elsif [:show, :edit].include?(action)
        should_deny_unauthenticated_users { get action, :id => resource.to_param }
      elsif :update == action
        should_deny_unauthenticated_users { put action, :id => resource.to_param }
      elsif :destroy == action
        should_deny_unauthenticated_users { delete action, :id => resource.to_param }
      else
        raise "Not supported action"
      end
    end
  end

  def should_allow_only_admins_to(actions, resource = nil)
    actions.each do |action|
      if [:index, :new].include?(action)
        should_allow_only_admin { get action }
      elsif :create == action
        should_allow_only_admin { post action }
      elsif [:show, :edit].include?(action)
        should_allow_only_admin { get action, :id => resource.to_param }
      elsif :update == action
        should_allow_only_admin { put action, :id => resource.to_param }
      elsif :destroy == action
        should_allow_only_admin { delete action, :id => resource.to_param }
      else
        raise "Not supported action"
      end
    end
  end
end
