require 'spec_helper'

describe Quest do
  describe "#update_user_quests" do
    let(:quest) { Factory :quest }    
    let(:first_user) { Factory :user }
    let(:second_user) { Factory :user }
    
    it "should create user quests" do
      expect { quest.update_user_quests([first_user.id, second_user.id]) }.
        to change(UserQuest, :count).from(0).to(2)
    end
  end
end
