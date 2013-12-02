require 'spec_helper'

describe Practice do
  it { should belong_to(:user) }
  it { should belong_to(:lesson) }
end
