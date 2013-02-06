require 'selenium-webdriver'
require 'selenium-client'
require 'capybara'

module RequestHelpers
  def current_user
    @user ||= Catarse::User.where(uid: 'fake_login').first
  end
end

Capybara.default_driver = :selenium
RSpec.configure do |config|
  config.include RequestHelpers, type: :request
  config.include Catarse::Core::Engine.routes.url_helpers, type: :request
  config.include Capybara::DSL, :type => :request
end
