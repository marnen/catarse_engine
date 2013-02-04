# encoding: utf-8

require 'spec_helper'

describe Catarse::PaymentEngines do
  let(:engine){ {name: 'test', review_path: ->(backer){ "/#{backer}" }, locale: 'en'} }
  let(:engine_pt){ {name: 'test pt', review_path: ->(backer){ "/#{backer}" }, locale: 'pt'} }
  before{ Catarse::PaymentEngines.clear }

  describe ".register" do
    before{ Catarse::PaymentEngines.register engine }
    subject{ Catarse::PaymentEngines.engines }
    it{ should == [engine] }
  end

  describe ".clear" do
    before do
      Catarse::PaymentEngines.register engine
      Catarse::PaymentEngines.clear
    end
    subject{ Catarse::PaymentEngines.engines }
    it{ should be_empty }
  end

  describe ".engines" do
    subject{ Catarse::PaymentEngines.engines }
    before do
      Catarse::PaymentEngines.register engine
      Catarse::PaymentEngines.register engine_pt
    end
    context "when locale is pt" do
      before do
        I18n.locale = :pt
      end
      it{ should == [engine_pt, engine] }
    end

    context "when locale is en" do
      before do
        I18n.locale = :en
      end
      it{ should == [engine, engine_pt] }
    end
  end
end
