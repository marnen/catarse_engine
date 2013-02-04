require 'spec_helper'

describe Catarse::ProjectTotal do
  before do
    @project_id = Factory(:backer, :value => 10.0, :confirmed => false).project_id
    Factory(:backer, :value => 10.0, :confirmed => true, :project_id => @project_id)
  end

  describe "#pledged" do
    subject{ Catarse::ProjectTotal.where(:project_id => @project_id).first.pledged }
    it{ should == 10 }
  end

  describe "#total_backers" do
    subject{ Catarse::ProjectTotal.where(:project_id => @project_id).first.total_backers }
    it{ should == 1 }
  end
end
