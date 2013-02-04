version = File.read(File.expand_path("../CATARSE_VERSION",__FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'catarse'
  s.version     = version
  s.summary     = 'An open source crowdfunding platform for creative projects'
  s.description = 'The first open source crowdfunding platform for creative projects in the world'

  s.files        = Dir['README.md', 'MIT-LICENSE', 'lib/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  s.required_ruby_version     = '>= 1.9.2'
  s.required_rubygems_version = '>= 1.8.11'

  s.author       = 'Daniel Weinmann'
  s.email        = 'danielweinmann@gmail.com'
  s.homepage     = 'https://github.com/danielweinmann/catarse'
  s.license      = %q{MIT}

  s.add_dependency 'catarse_core', version
end
