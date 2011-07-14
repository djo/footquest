require 'spec_helper'
require "cancan/matchers"

describe Ability do
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
