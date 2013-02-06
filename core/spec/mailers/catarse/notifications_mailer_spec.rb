require 'spec_helper'

describe Catarse::NotificationsMailer do
  let(:notification){ Factory(:notification, :notification_type => Factory(:notification_type, :name => 'confirm_backer'), :mail_params => {:project_name => Factory(:project).name}, :user => Factory(:user)) }
  subject{ Catarse::NotificationsMailer.notify(notification) }

  before do
    Catarse::Configuration['email_contact'] = 'contact@foo.bar'
    Mail::Message.any_instance.stubs(:deliver)
    Catarse::NotificationsMailer.any_instance.expects(:mail).at_least_once.with({
      :from => "#{I18n.t('site.name')} <#{Catarse::Configuration[:email_contact]}>",
      :to => notification.user.email,
      :subject => I18n.t('catarse.notifications.confirm_backer.subject', :project_name => notification.project.name),
      :template_name => 'confirm_backer'
    })
  end

  it("should satisfy expectations"){ subject }
end
