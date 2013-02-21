require 'spec_helper'

describe Catarse::NotificationsMailer do
  let(:notification){ FactoryGirl.create(:notification, :notification_type => FactoryGirl.create(:notification_type, :name => 'confirm_backer'), :mail_params => {:project_name => FactoryGirl.create(:project).name}, :user => FactoryGirl.create(:user)) }
  subject{ Catarse::NotificationsMailer.notify(notification) }

  before do
    Catarse::Configuration['email_contact'] = 'contact@foo.bar'
    Catarse::Configuration['company_name'] = 'Catarse'
    Mail::Message.any_instance.stubs(:deliver)
    Catarse::NotificationsMailer.any_instance.expects(:mail).at_least_once.with({
      :from => "#{Catarse::Configuration[:company_name]} <#{Catarse::Configuration[:email_contact]}>",
      :to => notification.user.email,
      :subject => I18n.t('notifications.confirm_backer.subject', :project_name => notification.project.name),
      :template_name => 'confirm_backer'
    })
  end

  it("should satisfy expectations"){ subject }
end

