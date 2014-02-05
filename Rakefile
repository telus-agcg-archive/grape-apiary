require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

require 'rubocop/rake_task'
Rubocop::RakeTask.new(:rubocop)

task default: [:rubocop, :spec]
