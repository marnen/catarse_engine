# encoding: UTF-8
version = File.read(File.expand_path("../../CATARSE_VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'catarse_core'
  s.version     = version
  s.summary     = ''
  s.description = ''

  s.files        = Dir['README.md', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  #s.add_dependency 'acts_as_list', '= 0.1.4'
  #s.add_dependency 'awesome_nested_set', '2.1.5'

  # This gem dependency is frozen ON PURPOSE to 2.1.4!!
  # This is because 2.2.0 uses jQuery 1.9 which breaks the jquery.horizontalNav
  # plugin that we are using in the admin backend.
  #s.add_dependency 'jquery-rails', '~> 2.1.4'
  #s.add_dependency 'select2-rails', '~> 3.2'

  #s.add_dependency 'highline', '= 1.6.11'
  #s.add_dependency 'state_machine', '= 1.1.2'
  #s.add_dependency 'ffaker', '~> 1.12.0'
  #s.add_dependency 'paperclip', '~> 2.8'
  #s.add_dependency 'aws-sdk', '~> 1.3.4'
  #s.add_dependency 'ransack', '~> 0.7.2'
  #s.add_dependency 'activemerchant', '~> 1.29.3'
  #s.add_dependency 'rails', '~> 3.2.11'
  #s.add_dependency 'kaminari', '0.13.0'
  #s.add_dependency 'deface', '>= 0.9.0'
  #s.add_dependency 'stringex', '~> 1.3.2'
  #s.add_dependency 'cancan', '1.6.8'
  #s.add_dependency 'money', '5.0.0'
  #s.add_dependency 'rabl', '0.7.2'
end