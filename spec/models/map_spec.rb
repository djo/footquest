require 'spec_helper'

describe Map do
  subject { Factory :map }
  it { should be_persisted }
end
