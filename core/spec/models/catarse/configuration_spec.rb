require 'spec_helper'

describe Catarse::Configuration do
  before do
    @config = FactoryGirl.build(:configuration, name: 'a_config', value: 'a_value')
  end

  it{ should validate_presence_of :name }
  it "should be valid from factory" do
    @config.should be_valid
  end

  context "#get" do
    before do
      @config.save
      FactoryGirl.create(:configuration, name: 'other_config', value: 'another_value')
    end
    it "should get config" do
      Catarse::Configuration[:a_config].should == 'a_value'
    end
    it "should return nil when not founf" do
      Catarse::Configuration[:not_found_config].should be(nil)
    end
    it "should return array" do
      expected= ['a_value', 'another_value']
      Catarse::Configuration[:a_config, :other_config].should == ['a_value', 'another_value']
    end
  end

end
