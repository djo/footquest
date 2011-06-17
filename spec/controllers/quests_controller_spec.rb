require 'spec_helper'

describe QuestsController do
  render_views
  
  should_deny_unauthenticated_users_to [:new, :create, :edit, :update, :destroy], Factory(:quest)
  
  describe "#create" do
    login_admin
    
    it "should update user quests" do
      user = Factory :user

      Quest.any_instance.should_receive(:update_user_quests).
                         with([user.id]).
                         and_return(true)
      
      post :create, :quest => Factory.attributes_for(:quest), :user_ids => [user.id]
    end
  end
end
