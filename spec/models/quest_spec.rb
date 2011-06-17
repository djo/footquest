require 'spec_helper'

describe Quest do
  describe "#update_user_quests" do
    let(:quest) { Factory :quest }    
    let(:first_user) { Factory :user }
    let(:second_user) { Factory :user }
    let(:third_user) { Factory :user }
    
    it "should create user quests" do
      expect { quest.update_user_quests([first_user.id, second_user.id]) }.
        to change(UserQuest, :count).from(0).to(2)
    end

    it "should update user quests" do
      quest.users << first_user
      quest.users << second_user
      
      quest.update_user_quests [first_user.id, third_user.id]
      quest.reload.users.should == [first_user, third_user]
    end
  end
end
