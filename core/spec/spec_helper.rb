# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'sidekiq/testing'
require 'factory_girl'
require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :mocha
  config.include Factory::Syntax::Methods
  config.include ActionView::Helpers::TextHelper

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  config.before(:suite) do
    ActiveRecord::Base.connection.execute "SET client_min_messages TO warning;"
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
    ActionMailer::Base.deliveries.clear
    Catarse::Project.any_instance.stubs(:store_image_url).returns('http://www.store_image_url.com')
    Catarse::Project.any_instance.stubs(:download_video_thumbnail)
    CatarseMailchimp::API.stubs(:subscribe)
    CatarseMailchimp::API.stubs(:unsubscribe)
    Catarse::Notification.stubs(:create_notification)
    Catarse::Notification.stubs(:create_notification_once)
    Catarse::ProjectObserver.any_instance.stubs(:after_create)
    Catarse::Calendar.any_instance.stubs(:fetch_events_from)
    Catarse::Blog.stubs(:fetch_last_posts).returns([])
    Catarse::ProjectsController.any_instance.stubs(:last_tweets)
    [Catarse::Projects::BackersController, Catarse::BackersController, Catarse::UsersController, Catarse::UnsubscribesController, Catarse::ProjectsController, Catarse::ExploreController, Catarse::SessionsController].each do |c|
      c.any_instance.stubs(:render_facebook_sdk)
      c.any_instance.stubs(:render_facebook_like)
      c.any_instance.stubs(:render_twitter)
    end
    DatabaseCleaner.clean
    RoutingFilter.active = false # Because this issue: https://github.com/svenfuchs/routing-filter/issues/36
  end

  def mock_tumblr method=:two
    require "#{Rails.root}/spec/fixtures/tumblr_data" # just a fixture
    Tumblr::Post.stubs(:all).returns(TumblrData.send(method))
  end
end



I18n.locale = :pt
I18n.default_locale = :pt

