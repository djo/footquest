require 'spec_helper'

describe CommentsController do
  render_views
  
  describe "#destroy" do
    let(:comment) { Factory :comment }
    
    should_deny_unauthenticated_users { do_request }
    
    it "should be able for the admin" do
      sign_in Factory(:admin)
      comment = Factory :comment
      
      do_request
      response.should be_success
    end

    it "should be able for the organizer" do
      user_quest = Factory :user_quest, :quest => comment.quest
      sign_in user_quest.user
      
      do_request
      response.should be_success
    end
    
    it "should not be able for the moderator" do
      sign_in Factory(:user)
      
      do_request
      response.should_not be_success
    end
    
    def do_request
      delete :destroy, :id => comment.id, :quest_id => comment.quest_id
    end
  end
end
