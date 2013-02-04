require 'spec_helper'

describe Catarse::PaymentNotificationObserver do
  describe 'before_save' do
    before do
      Catarse::Notification.unstub(:create_notification)
      Catarse::Notification.unstub(:create_notification_once)
      Factory(:notification_type, :name => 'processing_payment')
    end

    context "when payment is being processed" do
      before do
        Catarse::Notification.expects(:create_notification_once)
        p = Factory(:payment_notification)
        p.extra_data = {'status_pagamento' => '6'}
        p.backer.project = Factory(:project)
        p.save!
      end
      it("should notify the backer"){ p }
    end

    context "when payment is approved" do
      before do
        Catarse::Notification.expects(:create_notification_once).never
        p = Factory(:payment_notification)
        p.extra_data = {'status_pagamento' => '1'}
        p.backer.project = Factory(:project)
        p.save!
      end
      it("should not notify the backer"){ p }
    end

  end
end
