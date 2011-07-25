module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @user = Factory(:admin)
      sign_in @user
    end
  end
end
