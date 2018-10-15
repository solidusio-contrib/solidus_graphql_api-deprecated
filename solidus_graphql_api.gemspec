# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'solidus_graphql_api/version'

Gem::Specification.new do |s|
  s.author      = 'Daniel Honig'
  s.name        = 'solidus_graphql_api'
  s.version     = Spree::GraphQL::VERSION
  s.summary     = 'Solidus GraphQL API'
  s.description = 'GraphQL comes to Solidus'
  s.license     = 'BSD-3-Clause'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
    s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|s|features)/})
  end
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }

  s.add_dependency 'solidus_core', '~> 2.7.0'
  s.add_dependency 'graphql', "~> 1.8.10"

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rs-rails'
  s.add_development_dependency 'rubocop', '0.37.2'
  s.add_development_dependency 'rubocop-rs', '1.4.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
