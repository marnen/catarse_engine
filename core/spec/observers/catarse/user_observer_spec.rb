require 'spec_helper'

describe Catarse::UserObserver do
  context 'before_save' do
    subject { Factory(:user, twitter: '@should_be_change') }

    its(:twitter) { should == 'should_be_change' }
  end
end
