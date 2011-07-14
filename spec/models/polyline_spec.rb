require 'spec_helper'

describe Polyline do
  subject { Factory :polyline }
  it { should be_persisted }
end
