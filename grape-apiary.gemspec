lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grape-apiary/version'

Gem::Specification.new do |spec|
  spec.name          = 'grape-apiary'
  spec.version       = GrapeApiary::VERSION
  spec.authors       = ['John Allen']
  spec.email         = ['john@threedogconsulting.com']
  spec.homepage      = 'https://github.com/technekes/grape-apiary'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.summary = <<-SUMMARY
    Allows for generating an Apiary Blueprint for you Grape API
  SUMMARY

  spec.description = <<-DESCRIPTION
    Auto generates an Apiary (http://apiary.io) Blueprint from the
    docuementation that is created by your Grape API
  DESCRIPTION

  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'grape', '>= 0.16.0', '<= 1.0.1'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
  spec.add_development_dependency 'guard', '~> 2.4'
  spec.add_development_dependency 'guard-bundler', '~> 2.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.2'
  spec.add_development_dependency 'pry', '~> 0.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'rubocop', '>= 0.37', '< 1.0'
end
