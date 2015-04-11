# -*- encoding: utf-8 -*-
require File.expand_path('../lib/celluloid/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name         = 'celluloid'
  gem.version      = Celluloid::VERSION
  gem.platform     = Gem::Platform::RUBY
  gem.summary      = ''
  gem.description  = ''
  gem.licenses     = ['MIT']

  gem.authors      = ["Tony Arcieri", "Tim Carey-Smith", "digitalextremist //"]
  gem.email        = ['tony.arcieri@gmail.com', 'code@extremist.digital']
  gem.homepage     = 'https://github.com/celluloid/'

  gem.required_ruby_version     = '>= 1.9.2'
  gem.required_rubygems_version = '>= 1.3.6'

  gem.files        = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|examples|spec|features)/}) }
  gem.require_path = 'lib'

  gem.add_development_dependency 'bundler'
end
