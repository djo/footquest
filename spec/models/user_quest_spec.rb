require 'spec_helper'

describe UserQuest do
  subject { Factory :user_quest }
  it { should be_persisted }
end
