# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name         = 'celluloid-fsm'
  gem.version      = '0.9.0.pre1'
  gem.platform     = Gem::Platform::RUBY
  gem.summary      = 'Celluloid Finite State Machines'
  gem.description  = 'Simple finite state machines with integrated Celluloid timeout support.'
  gem.licenses     = ['MIT']

  gem.authors      = ["Tony Arcieri", "Tim Carey-Smith", "digitalextremist //"]
  gem.email        = ['tony.arcieri@gmail.com', 'code@extremist.digital']
  gem.homepage     = 'https://github.com/celluloid/celluloid-fsm'

  gem.required_ruby_version     = '>= 1.9.2'
  gem.required_rubygems_version = '>= 1.3.6'

  gem.files        = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|examples|spec|features)/}) }
  gem.require_path = 'lib'

  gem.add_development_dependency 'bundler'
  gem.add_runtime_dependency 'celluloid', '>= 0.17.0.pre0'
  gem.add_runtime_dependency 'celluloid-essentials', '>= 0.20.0.pre0'
  gem.add_development_dependency 'celluloid-supervision', '>= 0.13.9.pre0'
  gem.add_development_dependency 'celluloid-pool', '>= 0.10.0.pre0'

end
