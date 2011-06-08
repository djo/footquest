module ControllerMacros
  def should_deny_unauthenticated_user(&block)
    it "should deny an unauthenticated user" do
      sign_out @user if @user

      instance_eval &block
      response.should redirect_to(root_url)
      flash[:alert].should == "You are not authorized to access this page."
    end
  end
  
  def should_deny_unauthenticated_user_to(actions, resource = nil)
    actions.each do |action|
      if [:index, :new].include?(action)
        should_deny_unauthenticated_user { get action }
      elsif :create == action
        should_deny_unauthenticated_user { post action }
      elsif [:show, :edit].include?(action)
        should_deny_unauthenticated_user { get action, :id => resource.to_param }
      elsif :update == action
        should_deny_unauthenticated_user { put action, :id => resource.to_param }
      elsif :destroy == action
        should_deny_unauthenticated_user { delete action, :id => resource.to_param }
      else
        raise "Not supported action"
      end
    end
  end
end
