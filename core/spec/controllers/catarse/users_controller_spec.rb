#encoding:utf-8
require 'spec_helper'

describe Catarse::UsersController do
  render_views
  subject{ response }
  before do
    controller.stubs(:current_user).returns(current_user)
  end

  let(:successful_project){ FactoryGirl.create(:project, state: 'successful') }
  let(:failed_project){ FactoryGirl.create(:project, state: 'failed') }
  let(:backer){ FactoryGirl.create(:backer, :user => user, :project => failed_project) }
  let(:user){ FactoryGirl.create(:user, authorizations: [FactoryGirl.create(:authorization, uid: 666, oauth_provider: FactoryGirl.create(:oauth_provider, name: 'facebook'))]) }
  let(:current_user){ user }

  describe "PUT update" do
    before do
      put :update, id: user.id, locale: 'pt', user: { twitter: 'test' }
    end
    it("should update the user") do
      user.reload
      user.twitter.should ==  'test'
    end
    it{ should redirect_to user_path(user, :anchor => 'settings') }
  end

  describe "GET set_email" do
    before do
      get :set_email, locale: 'pt'
    end
    it{ should render_template('set_email') }
  end

  describe "PUT update_email" do
    let(:email){ 'new_email@bar.com' }
    let(:return_to){ nil }
    before do
      session[:return_to] = return_to
      put :update_email, id: user.id, locale: 'pt', user: {email: email}
    end

    context "when email is not valid" do
      let(:email){ 'new_email_bar.com' }
      it{ should render_template('set_email') }
    end

    context "when email is valid and we have a session[:return_to]" do
      let(:return_to){ '/foo' }
      it{ should redirect_to return_to }
    end

    context "when email is valid" do
      it("should update the user") do
        user.reload
        user.email.should ==  'new_email@bar.com'
      end
      it{ should redirect_to user_path(user, :anchor => 'settings') }
    end
  end

  describe "GET show" do
    before do
      FactoryGirl.create(:notification_type, name: 'updates')
      get :show, :id => user.id, :locale => 'pt'
    end

    it{ assigns(:fb_admins).should include(user.facebook_id.to_i) }
  end

  describe "POST request_refund" do
    let(:previous_backs){ nil }
    let(:response_body){ {status: status_message, credits: user.reload.display_credits}.to_json }
    let(:status_message){ nil }

    before do
      previous_backs
      post :request_refund, { id: user.id, back_id: backer.id }
    end

    context "without user" do
      let(:current_user){ nil }
      it "should not set requested_refund" do
        backer.reload
        backer.requested_refund.should be_false
      end
      it{ should redirect_to new_user_session_path }
    end

    context "with user when we have the value to refund" do
      let(:status_message){ I18n.t('catarse.credits.index.refunded') }
      its(:body){ should == response_body }
    end

    context "with user when we do not have the value to refund" do
      let(:status_message){ I18n.t('catarse.credits.refund.no_credits') }
      let(:previous_backs){ FactoryGirl.create(:backer, :user => user, :project => successful_project, :credits => true) }
      its(:body){ should == response_body }
    end

    context "when backer cannot be refunded" do
      let(:status_message){ I18n.t('catarse.credits.refund.refunded') }
      let(:backer){ FactoryGirl.create(:backer, :user => user, :project => failed_project, :refunded => true) }
      its(:body){ should == response_body }
    end

    context "when backer already requested to refund" do
      let(:status_message){ I18n.t('catarse.credits.refund.requested_refund') }
      let(:backer){ FactoryGirl.create(:backer, :user => user, :project => failed_project, :requested_refund => true) }
      its(:body){ should == response_body }
    end
  end
end
