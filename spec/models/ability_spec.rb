require 'spec_helper'
require "cancan/matchers"

describe Ability do
  context "User" do
    specify "unauthenticated user can only see users" do
      ability = Ability.new nil
      ability.should be_able_to(:read, User)
      ability.should_not be_able_to(:manage, User)
    end
    
    specify "moderator can only update his profile" do
      user = Factory :user
      
      ability = Ability.new user
      ability.should be_able_to(:update, user)
      ability.should_not be_able_to(:update, User.new)
    end
    
    specify "moderator can't create users" do
      user = Factory :user
      
      ability = Ability.new user
      ability.should_not be_able_to(:create, User)
    end
  end

  context "Quest" do
    specify "unauthenticated user can only see quests" do
      ability = Ability.new nil
      ability.should be_able_to(:read, Quest)
      ability.should_not be_able_to(:manage, Quest)
    end
    
    specify "moderator can only update quests which he owns" do
      user_quest = Factory :user_quest
      
      ability = Ability.new user_quest.user
      ability.should be_able_to(:update, user_quest.quest)
      ability.should_not be_able_to(:update, Quest.new)
    end
  end

  context "Map" do
    specify "unauthenticated user can only see maps" do
      ability = Ability.new nil
      ability.should be_able_to(:read, Map)
      ability.should_not be_able_to(:manage, Map)
    end
    
    specify "moderator can only update map which he owns" do
      user_quest = Factory :user_quest
      map = Factory :map, :quest => user_quest.quest
      
      ability = Ability.new user_quest.user
      ability.should be_able_to(:update, map)
      ability.should_not be_able_to(:update, Map.new)
    end
  end

  context "Comment" do
    specify "unauthenticated user can create a comment" do
      ability = Ability.new nil
      ability.should be_able_to(:create, Comment)
    end
    
    specify "moderator can only destroy comments which he owns" do
      user_quest = Factory :user_quest
      comment = Factory :comment, :quest => user_quest.quest
      
      ability = Ability.new user_quest.user
      ability.should be_able_to(:destroy, comment)
      ability.should_not be_able_to(:destroy, Comment.new)
    end
  end
end
