require 'spec_helper'

describe Catarse::Statistics do
  before do
    FactoryGirl.create(:project, state: 'successful')
    FactoryGirl.create(:project, state: 'draft')
    project = FactoryGirl.create(:project, state: 'online')
    FactoryGirl.create(:backer, confirmed: true, project: project )
    FactoryGirl.create(:backer, confirmed: false, project: project)
  end

  describe "#total_users" do
    subject{ Catarse::Statistics.first.total_users }
    it{ should == Catarse::User.primary.count }
  end

  describe "#total_backs" do
    subject{ Catarse::Statistics.first.total_backs }
    it{ should == Catarse::Backer.confirmed.count }
  end

  describe "#total_backers" do
    subject{ Catarse::Statistics.first.total_backers }
    it{ should == Catarse::User.backers.count }
  end

  describe "#total_backed" do
    subject{ Catarse::Statistics.first.total_backed }
    it{ should == Catarse::Backer.confirmed.sum(:value) }
  end

  describe "#total_projects" do
    subject{ Catarse::Statistics.first.total_projects }
    it{ should == Catarse::Project.visible.count }
  end

  describe "#total_projects_success" do
    subject{ Catarse::Statistics.first.total_projects_success }
    it{ should == Catarse::Project.successful.count }
  end

  describe "#total_projects_online" do
    subject{ Catarse::Statistics.first.total_projects_online }
    it{ should == Catarse::Project.online.count }
  end
end

