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

  #s.add_dependency ''
  #s.add_development_dependency 'factory_girl_rails', '1.7.0'

end
