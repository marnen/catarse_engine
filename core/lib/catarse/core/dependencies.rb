require 'sidekiq'
require 'foreman'
require 'best_in_place'

require 'state_machine/core'

# Database and data related
#require 'pg'
require 'pg_search'
require 'postgres-copy'
require 'schema_plus'

#require 'catarse_paypal_express', git: 'git://github.com/devton/catarse_paypal_express.git', ref: '4fd17e269395ee4b3a32528ace0bcb7eec57a953'
#require 'catarse_paypal_express', path: '../catarse_paypal_express'
#require 'catarse_moip', git: 'git://github.com/devton/catarse_moip.git'
#require 'catarse_moip', path: '../catarse_moip'
#require 'moip', git: 'git://github.com/moiplabs/moip-ruby.git'

require 'draper'

# Frontend stuff
require 'jquery-rails'

require 'devise'
require 'cancan'

# Error reporting
require "airbrake"

# Email marketing
#require 'mailchimp'
require 'catarse_mailchimp'#, git: 'git://github.com/devton/catarse_mailchimp'

# HTML manipulation and formatting
require 'formtastic'
require "auto_html"
require 'kaminari'
require 'rails_autolink'

# Uploads
require 'carrierwave'
require 'fog'

# Other Tools
require 'feedzirra'
require 'validation_reflection'
require 'inherited_resources'
require 'has_scope'
require 'validates_email'
require 'has_vimeo_video'
require 'weekdays'
require "rack-timeout"

# Translations
require 'http_accept_language'
require 'routing-filter'

# Payment
require 'active_merchant'
require 'httpclient'

require 'sass-rails'
require 'coffee-rails'
require 'compass-rails'
require 'ninesixty'


# NOT NECESSARY, I THING
#require "RedCloth"
#require 'enumerate_it'
#require 'httparty'

# Authentication and Authorization
#require 'omniauth'
#require 'omniauth-openid'
#require 'omniauth-twitter'
#require 'omniauth-facebook'
##require 'omniauth-github'
#require 'omniauth-linkedin'
#require 'omniauth-yahoo'
