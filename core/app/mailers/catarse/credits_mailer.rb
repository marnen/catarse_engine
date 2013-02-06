module Catarse
class CreditsMailer < ActionMailer::Base
  include ERB::Util

  def request_refund_from(backer)
    @backer = backer
    @user = backer.user
    mail(from: "#{I18n.t('site.name')} <#{Catarse::Configuration[:email_system]}>", to: Catarse::Configuration[:email_payments], :subject => I18n.t('catarse.credits_mailer.request_refund_from.subject', :name => @backer.project.name))
  end
end
end
