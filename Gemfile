# frozen_string_literal: true

source 'https://rubygems.org'

solidus_branch = ENV.fetch('SOLIDUS_BRANCH', 'master')

gem 'solidus', github: 'solidusio/solidus', branch: solidus_branch
gem 'solidus_auth_devise'

if ENV['DB'] == 'mysql'
  gem 'mysql2', '~> 0.4.10'
else
  gem 'pg', '~> 0.21'
end

gemspec

local_gemfile = File.expand_path('.Gemfile', __dir__)
instance_eval File.read local_gemfile if File.exist? local_gemfile
