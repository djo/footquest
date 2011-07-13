require 'spec_helper'

describe Placemark do
  subject { Factory :placemark }
  it { should be_persisted }
end
