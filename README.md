Solidus GraphQL API
===================

NOTE: This is a work in progress.

Please join the Solidus Slack #graphql channel if you are interested.

Installation
------------

1) Add solidus_graphql_api to your `Gemfile`. The complete block added to `Gemfile` could look like this:

```ruby
gem 'solidus'
gem 'solidus_auth_devise'
gem 'solidus_graphql_api', github: 'boomerdigital/solidus_graphql_api'

gem 'graphiql-rails', group: :development
```

2) Run `bundle`:

```shell
bundle
```

NOTE: If this is your new Rails + Solidus application, please don't forget to run the Solidus installation steps, which at a minimum consist of adding the database `username`, `password`, and `host` in `config/database.yml`'s `default` block and running `bundle exec rails g spree:install`.

3) Add routes to your application's `config/routes.rb` to serve GraphQL and optionally also GraphiQL queries in development mode:

```ruby
  get "/graphql", to: "spree/graphql#execute"
  post "/graphql", to: "spree/graphql#execute"

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
```

Running
-------

To run the whole app, run your usual `bundle exec rails s`.

To perform a test GraphQL query, you can use any of the following methods:

```shell
# If using HTTP GET (arguments passed as query strings):
wget -qO- 'http://localhost:3000/graphql?query={ shop { name } }'
GET 'http://localhost:3000/graphql?query={ shop { name } }'

# If using HTTP POST (arguments passed in JSON body):
curl http://localhost:3000/graphql -H content-type:application/json -d '{ "query": " { shop { name } }" }'
wget http://localhost:3000/graphql --header content-type:application/json -qO- --post-data '{ "query": " { shop { name } }" }'
echo '{ "query": "{ shop { name } }" }' | POST -c application/json http://localhost:3000/graphql
POST -c application/json http://localhost:3000/graphql <<< '{ "query": "{ shop { name } }" }'

# If using HTTP POST with query strings (also works, may be simpler to write during testing):
curl http://localhost:3000/graphql -d 'query={ shop { name } }'
wget http://localhost:3000/graphql -qO- --post-data 'query={ shop { name } }'
echo 'query={ shop { name } }' | POST http://localhost:3000/graphql
POST http://localhost:3000/graphql <<< 'query={ shop { name } }'
```

Assuming you are running this on a default Rails/Solidus installation with sample data, the response should look like this:

```json
{"data":{"shop":{"name":"Sample Store"}}}
```

To open GraphiQL browser, visit [http://localhost:3000/graphiql](http://localhost:3000/graphiql) in your browser while in development environment.

To see what queries can currently be specified, see GraphiQL's web interface or files `lib/solidus_graphql_api/graphql/schema/types/query_root.rb` and `lib/solidus_graphql_api/graphql/schema/types/mutation.rb`.

Testing
-------

To run tests, invoke `rake`. `rake` will default to building a dummy app in `spec/dummy`, running [Rubocop](https://github.com/bbatsov/rubocop) static code analysis, and finally running the specs.

```shell
bundle
bundle exec rake

# Or individually:
bundle exec rake test_app
bundle exec rake rubocop
bundle exec rake spec

# Or using rspec for tests directly:
bundle exec rspec
bundle exec rspec spec/graphql/types/product_spec.rb
```
