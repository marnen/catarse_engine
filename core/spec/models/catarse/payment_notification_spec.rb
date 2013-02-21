require 'spec_helper'

describe Catarse::PaymentNotification do
  describe "#extra_data" do
    let(:test_hash){{"test_hash" => 1}}
    before do
      @p = Catarse::PaymentNotification.new(backer_id: FactoryGirl.create(:backer).id, extra_data: test_hash)
      @p.save!
    end
    subject{ @p.extra_data }
    it{ should == test_hash }
  end
end
