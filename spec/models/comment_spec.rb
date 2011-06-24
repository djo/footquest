require 'spec_helper'

describe Comment do
  subject { Factory :comment }
  it { should be_persisted }
end
