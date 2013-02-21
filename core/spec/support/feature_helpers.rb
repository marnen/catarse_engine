require 'selenium-webdriver'
require 'selenium-client'
require 'capybara'

module FeatureHelpers
  def login
    visit new_user_session_path
    within ".new_session" do
      fill_in 'user_email', with: current_user.email
      fill_in 'user_password', with: 'test123'
      click_on 'user_submit'
    end
  end

  def current_user
    @user ||= FactoryGirl.create(:user, password: 'test123', password_confirmation: 'test123')
  end
end
Capybara.default_driver = :selenium

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
  config.include Catarse::Core::Engine.routes.url_helpers, type: :feature
  config.include Capybara::DSL, :type => :feature
end
