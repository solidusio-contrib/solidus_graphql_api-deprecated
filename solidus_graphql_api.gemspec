# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_graphql_api/version'

Gem::Specification.new do |s|
  s.author      = 'Daniel Honig'
  s.name        = 'solidus_graphql_api'
  s.version     = SolidusGraphqlApi::VERSION
  s.summary     = 'Solidus GraphQL API'
  s.description = 'GraphQL comes to Solidus'
  s.license     = 'BSD-3-Clause'
  s.files       = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.bindir      = 'exe'
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }

  s.add_dependency 'graphql', '~> 1.9.3'
  s.add_dependency 'solidus_core', '>= 2.7.0'

  s.add_development_dependency 'database_cleaner'
  # s.add_development_dependency 'byebug'
  s.add_development_dependency 'factory_bot'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '~> 0.79.0'
  s.add_development_dependency 'rubocop-rspec', '~> 1.32.0'
  s.add_development_dependency 'solidus_support', '>= 0.1.3'
  s.add_development_dependency 'sqlite3', '~> 1.3.6'
end
