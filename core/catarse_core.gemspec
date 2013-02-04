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
  s.requirements << 'none'

  #s.add_dependency ''
  #s.add_development_dependency 'factory_girl_rails', '1.7.0'

end
