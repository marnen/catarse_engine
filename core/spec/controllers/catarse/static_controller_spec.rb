#encoding: utf-8
require 'spec_helper'

describe Catarse::StaticController do

  render_views
  subject{ response }

  describe 'GET guidelines' do
    before{ get :guidelines, {:locale => :pt} }
    it{ should be_success }
    its(:body){ should =~ /#{I18n.t('catarse.static.guidelines.title')}/ }
    its(:body){ should =~ /#{I18n.t('catarse.static.guidelines.subtitle')}/ }
  end

  describe 'GET faq' do
    before{ get :faq, {:locale => :pt} }
    it{ should be_success }
    its(:body){ should =~ /#{I18n.t('catarse.static.faq.title')}/ }
  end

  describe "GET sitemap" do
    before{ get :sitemap, {:locale => :pt} }
    it{ should be_success }
  end
end
