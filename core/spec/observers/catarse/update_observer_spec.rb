require 'spec_helper'

describe Catarse::UpdateObserver do
  describe 'after_create' do
    context "call notify update worker" do
      before do
        Catarse::NotifyUpdateWorker.jobs.clear
        @project = FactoryGirl.create(:project)
      end

      it "should send to queue" do
        update = Catarse::Update.create!(:user => @project.user, :project => @project, :comment => "this is a comment")
        Catarse::NotifyUpdateWorker.jobs.size.should == 1
      end
    end
  end
end

