# frozen_string_literal: true

require 'bundler'

Bundler::GemHelper.install_tasks

require 'spree/testing_support/extension_rake'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new

task default: %i(first_run rubocop spec)

task :first_run do
  if Dir['spec/dummy'].empty?
    Rake::Task[:test_app].invoke
    Dir.chdir('../../')
  end
end

desc 'Shorthand to generate dummy app for testing the extension with defaults'
task :test_app do
  ENV['LIB_NAME'] = 'solidus_graphql_api'
  Rake::Task['extension:test_app'].invoke
end
