# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grape-apiary/version'

Gem::Specification.new do |spec|
  spec.name          = 'grape-apiary'
  spec.version       = GrapeApiary::VERSION
  spec.authors       = ['John Allen']
  spec.email         = ['john@threedogconsulting.com']
  spec.summary       = %q{Allows for generating an Apiary Blueprint for you Grape API}
  spec.description   = %q{Auto generates an Apiary (http://apiary.io) Blueprint from the docuementation that is created by your Grape API}
  spec.homepage      = 'https://github.com/connexio-labs/grape-apiary'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'grape', '~> 0.6'

  spec.add_development_dependency 'coveralls', '~> 0.7'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.18'
  spec.add_development_dependency 'pry', '~> 0.9'
end
