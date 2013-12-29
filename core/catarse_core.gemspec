# encoding: UTF-8
version = File.read(File.expand_path("../../CATARSE_VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'catarse_core'
  s.version     = version
  s.summary     = 'Required dependency for catarse'
  s.description = 'The first open source crowdfunding platform for creative projects in the world'

  s.author       = 'Daniel Weinmann'
  s.email        = 'danielweinmann@gmail.com'
  s.homepage     = 'https://github.com/danielweinmann/catarse'
  s.license      = %q{MIT}

  s.files        = Dir['app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*']
  s.require_path = 'lib'
  #s.requirements << 'none'

  s.add_dependency 'rails', '~> 3.2.12'

  s.add_dependency 'sidekiq', '= 2.4.0'
  s.add_dependency 'sinatra'#, require: false
  s.add_dependency 'foreman'
  s.add_dependency 'best_in_place'

  s.add_dependency 'state_machine'#, require: 'state_machine/core'

  # Database and data related
  s.add_dependency 'pg'
  s.add_dependency 'pg_search'
  s.add_dependency 'postgres-copy'
  s.add_dependency 'schema_plus'
	s.add_dependency 'schema_associations'

  #s.add_dependency 'catarse_paypal_express', git: 'git://github.com/devton/catarse_paypal_express.git', ref: '4fd17e269395ee4b3a32528ace0bcb7eec57a953'
  #s.add_dependency 'catarse_paypal_express', path: '../catarse_paypal_express'
  #s.add_dependency 'catarse_moip', git: 'git://github.com/devton/catarse_moip.git'
  #s.add_dependency 'catarse_moip', path: '../catarse_moip'
  #s.add_dependency 'moip', git: 'git://github.com/moiplabs/moip-ruby.git'

  s.add_dependency 'draper'

  # Frontend stuff
  s.add_dependency 'slim'
  s.add_dependency 'slim-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'initjs'

  # Authentication and Authorization
  s.add_dependency 'omniauth', "~> 1.1.3"
  s.add_dependency 'omniauth-twitter', '~> 0.0.14'
  s.add_dependency 'omniauth-facebook', '~> 1.4.0'
  s.add_dependency 'devise', '~> 2.2.3'
  s.add_dependency 'cancan'#, git: 'git://github.com/ryanb/cancan.git', branch: '2.0'


  # Error reporting
  s.add_dependency "airbrake"

  # Email marketing
  #s.add_dependency 'mailchimp'
  s.add_dependency 'catarse_mailchimp'#, git: 'git://github.com/devton/catarse_mailchimp'

  # HTML manipulation and formatting
  s.add_dependency 'formtastic', "~> 2.1.1"
  s.add_dependency "auto_html", '= 1.4.2'
  s.add_dependency 'kaminari'
  s.add_dependency 'rails_autolink', '~> 1.0.7'

  # Uploads
  s.add_dependency 'carrierwave', '~> 0.7.0'
  s.add_dependency 'rmagick'
  s.add_dependency 'fog'

  # Other Tools
  s.add_dependency 'feedzirra', '~> 0.6.0'
  s.add_dependency 'validation_reflection'#, git: 'git://github.com/ncri/validation_reflection.git'
  s.add_dependency 'inherited_resources', '1.3.1'
  s.add_dependency 'has_scope'
  s.add_dependency 'spectator-validates_email'#, require: 'validates_email'
  s.add_dependency 'has_vimeo_video', '~> 0.0.5'
  s.add_dependency 'weekdays'
  s.add_dependency "RedCloth"
  s.add_dependency 'enumerate_it'
  s.add_dependency 'httparty', '~> 0.6.1'
  s.add_dependency "rack-timeout"

  # Translations
  s.add_dependency 'http_accept_language'
  s.add_dependency 'routing-filter' #, :git => 'git://github.com/svenfuchs/routing-filter.git'

  # Payment
  s.add_dependency 'activemerchant', '1.17.0'#, require: 'active_merchant'
  s.add_dependency 'httpclient', '2.2.5'

  # Assests
  s.add_dependency 'sass-rails',   '~> 3.2.5'
  s.add_dependency 'coffee-rails', '~> 3.2.2'
  s.add_dependency 'compass-rails', '~> 1.0.2'
  #s.add_dependency 'uglifier', '>= 1.0.3'
  s.add_dependency 'compass-960-plugin', '~> 0.10.4'

  # Development
  s.add_development_dependency 'mailcatcher'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'rspec-rails', "~> 2.12"
  s.add_development_dependency 'mocha', '0.10.4'
  s.add_development_dependency 'shoulda'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'capybara', ">= 1.0.1"
end
