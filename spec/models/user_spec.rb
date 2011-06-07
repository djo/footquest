require 'spec_helper'

describe User do
  describe "#role?" do
    let(:user) { Factory :user, :role => 'admin'  }
    
    it { user.role?(:admin).should be_true }
    it { user.role?(:moderator).should be_false }
  end
end
