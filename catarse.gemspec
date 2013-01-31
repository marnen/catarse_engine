# encoding: UTF-8
version = File.read(File.expand_path("../CATARSE_VERSION",__FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'catarse'
  s.version     = version
  s.summary     = ''
  s.description = ''

  s.files        = Dir['README.md', 'lib/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  s.required_ruby_version     = '>= 1.9.2'
  #s.required_rubygems_version = ">= 1.3.6"

  s.author       = ''
  s.email        = ''
  s.homepage     = ''
  s.license      = %q{MIT}

  s.add_dependency 'catarse_core', version
end
