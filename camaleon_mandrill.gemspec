$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'camaleon_mandrill/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = 'camaleon_mandrill'
  s.version = CamaleonMandrill::VERSION
  s.authors = ['Raúl Anatol']
  s.email = ['raul@natol.es']
  s.homepage = 'http://camaleon.tuzitio.com/store/plugins/10'
  s.summary = ': Summary of CamaleonMandrill.'
  s.description = ': Description of CamaleonMandrill.'
  s.license = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2', '>= 4.2.4'
end
