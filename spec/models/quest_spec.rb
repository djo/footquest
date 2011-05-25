require 'spec_helper'

describe Quest do
  it "should be persisted" do
    Factory(:quest).should be_persisted
  end
end
