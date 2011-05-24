require 'spec_helper'

describe User do
  it "should be persisted" do
    Factory(:user).should be_persisted
  end
end
