require 'bundler'

Bundler::GemHelper.install_tasks

require 'spree/testing_support/extension_rake'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new

task default: %i(first_run rubocop spec)

def system!(*args)
  system(*args) || abort("\n== Command #{args} failed ==")
end

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

  Bundler.with_clean_env do
    system! 'bundle init'

    File.write 'Gemfile', <<~RUBY, mode: 'a'
      gem 'rails'
      gem 'sqlite3', '~> 1.3.6'
      gem 'solidus'
      gem 'solidus_auth_devise'
      gem 'solidus_graphql_api', path: '../..'
      gem 'graphiql-rails'
    RUBY

    system! 'bundle install'
  end
end
