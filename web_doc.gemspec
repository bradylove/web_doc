# -*- encoding: utf-8 -*-

require File.expand_path('../lib/web_doc/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "web_doc"
  gem.version       = WebDoc::VERSION
  gem.summary       = %q{TODO: Summary}
  gem.description   = %q{TODO: Description}
  gem.license       = "MIT"
  gem.authors       = ["Brady Love"]
  gem.email         = "love.brady@gmail.com"
  gem.homepage      = "https://github.com/bradylove/web_doc#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'slim', '2.0.1'

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 0.8'
  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_development_dependency 'yard', '~> 0.8'
end
