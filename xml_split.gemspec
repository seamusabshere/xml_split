# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xml_split/version'

Gem::Specification.new do |gem|
  gem.name          = "xml_split"
  gem.version       = XmlSplit::VERSION
  gem.authors       = ["Seamus Abshere"]
  gem.email         = ["seamus@abshere.net"]
  gem.description   = %q{Split XML files on an element, yielding (streaming, so constant memory usage) each node in turn. Uses sgrep internally.}
  gem.summary       = %q{Split XML files on an element, yielding (streaming, so constant memory usage) each node in turn.}
  gem.homepage      = "https://github.com/seamusabshere/xml_split"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec-core'
  gem.add_development_dependency 'rspec-expectations'
  gem.add_development_dependency 'rspec-mocks'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'yard'
end
