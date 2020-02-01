# Solidus GraphQL API

#DEPRECATED

See -> https://github.com/boomerdigital/solidus_graphql_api



[![Build Status](https://api.travis-ci.org/solidusio-contrib/solidus_graphql_api.svg?branch=master)](https://travis-ci.org/solidusio-contrib/solidus_graphql_api)

NOTE: This is a work in progress. Please join the Solidus Slack #graphql channel at [https://solidusio.slack.com/](https://solidusio.slack.com/) if you are interested.

The complete list of Solidus GraphQL calls and their implementation status can be found below, towards the end of the document.


## Installation

1) Add solidus_graphql_api to your `Gemfile`. The complete block added to `Gemfile` could look like this:

```ruby
gem 'solidus'
gem 'solidus_auth_devise'
gem 'solidus_graphql_api', github: 'solidusio-contrib/solidus_graphql_api'

gem 'graphiql-rails', group: :development
```

2) Run `bundle`:

```sh
bundle
```

3) Run the extension generator and run `bundle` again as it could insert additional dependencies:

```sh
bundle exec rails g solidus_graphql_api:install
bundle
```

NOTE: If this is your new Rails + Solidus application, please don't forget to run the Solidus installation steps, which at a minimum consist of adding the database `username`, `password`, and `host` in `config/database.yml`'s `default` block and running `bundle exec rails g spree:install`.

4) Add routes to your application's `config/routes.rb` to serve GraphQL and optionally also GraphiQL queries in development mode:

```ruby
  post :graphql, to: 'spree/graphql#execute'

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
```

## Testing and Usage

To run the whole app, run your usual `bundle exec rails s`.

To perform a test GraphQL query, you can use any of the following methods:

```shell
# Using HTTP POST (arguments passed in JSON body):
curl http://localhost:3000/graphql -H content-type:application/json -d '{ "query": " { shop { name } }" }'
wget http://localhost:3000/graphql --header content-type:application/json -qO- --post-data '{ "query": " { shop { name } }" }'
echo '{ "query": "{ shop { name } }" }' | POST -c application/json http://localhost:3000/graphql
POST -c application/json http://localhost:3000/graphql <<< '{ "query": "{ shop { name } }" }'

# Using HTTP POST with query strings (also works, may be simpler to write during testing):
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

To see what queries can currently be specified, see GraphiQL's web interface.

Please note that all GraphQL API fields which do not yet contain an actual implementation will return a `NotImplementedError`. For all such fields that you attempt to use but they aren't available, please submit an issue or report them in Solidus Slack channel #graphql. That will help prioritize work and ensure we begin with the implementation on the next working day.

## How to Contribute

In solidus_graphql_api, GraphQL files are located in directory `lib/spree/graphql/`. And additionally, there is also top-level directory `spec/` with all the specs.

To e.g. implement `Order.totalTax`, you would do as follows:

1. Add the schema definition and the implementation code in file `./lib/spree/graphql/schema/types/order.rb`
1. Add specs in file `./spec/spree/graphql/schema/types/order_spec.rb`
1. After specs pass, update `README.md` to mark new GraphQL calls as implemented and submit a PR

Notes / additional help on adding code and specs follow:

### Adding GraphQL Field Implementations

As you might know, every GraphQL field returns either an object for more querying on it, or a leaf value.

For example, a query such as `{ shop { primaryDomain { url }}}` expects `QueryRoot.shop` to return an instance of `Shop`, `shop.primaryDomain` to return an instance of `Domain`, and finally `primaryDomain.url` to return the leaf value containing the URL. If it happens that non-leaf fields return a leaf value (or leaf fields return a non-leaf value), an error is raised.

In the simplest cases, especially those in which the created GraphQL types have direct equivalents in Solidus core, the implementations can be trivial. For example, for `{ shop { name }}`, `shop` may just return an instance of `Spree::Store` and `name` may just call `name` on that instance.

Sometimes, however, types do not have direct mappings. For example, GraphQL type `Domain` has fields `host`, `sslEnabled`, and `url`. It does not have a direct equivalent in Solidus, and it is not backed by a database. However, we know we can put this information together; `host` by calling `Spree::Store#url`, `sslEnabled` by querying `Rails.configuration.force_ssl`, and `url` by concatenating the protocol and host together. The only thing left to do then is to decide where to put this code.

Option 1: for insignificant, disposable types, we can add implementation directly in the GraphQL method for `shop.primaryDomain` (`./lib/spree/graphql/schema/types/shop.rb`):

```
require 'ostruct'
def primaryDomain
  ssl = Rails.configuration.force_ssl
  url_prefix = ssl ? 'https://' : 'http://'

  OpenStruct.new(
    host: object.url,
    ssl_enabled: ssl,
    url: url_prefix + object.url
  )
end
```

Option 2: for more important types which may be created and have additional methods defined on them, we can create a Ruby class (`./lib/spree/graphql/domain.rb`) and instantiate it from `primaryDomain`:

```
class Spree::GraphQL::Domain
  attr_reader :host, :ssl_enabled, :url

  def initialize(host, ssl_enabled, url = nil)
    @host = host
    @ssl_enabled = ssl_enabled
    @url = url || ((@ssl_enabled ? 'https://' : 'http://') + @host)
  end
end

```

(If a type is backed by a database and represents a model, `app/models/` would be used instead of `lib/spree/graphql/`.)

### Adding Corresponding specs

[Spec helpers](spec/support/graphql.rb) are provided to run a typical GraphQL spec: these helpers are automatically defined for specs located within `spec/spree/graphql/schema/`.

A typical spec is structured as the following:

```ruby
let(:ctx) { { context_key: 'contextValue' } }
let(:variables) { { var1: 'var1', var2: 'var2' } }
let(:query) { '{ someQuery }' }
let(:result) { { someResultKey: 'someResultValue' } }

it 'succeeds' do
  execute
  expect(response_hash).to eq(result_hash)
end
```

The header of each spec defines the GraphQL query and expected result, followed by an `it` block which actually runs the query and comparison.

The command to execute queries is just `execute`. It runs `Schema.execute()` with defaulting to `query()`, `context()` and `variables()` unless these params are manually provided.

After the query is executed, the response is available through `response()` as usual.

For it, there are helpers defined &mdash; `response_json()` to get JSON string of the response, and `response_hash()` to get Ruby hash of the response.

For the expected result, there are analogously-named helpers defined on it: `result_json()` and `result_hash()`.

So, to match the response to the expected result, one can use either of the following methods, regardless of the format in which the response and result were originally given:

```
expect(response_json).to eq(result_json)

expect(response_hash).to eq(result_hash)
```

For helper types and classes which are not directly accessible from the outside (such as type `Domain`), it is not necessary to make GraphQL calls but classes themselves can be tested.

Please see the spec files for more examples. Good places to check first are the specs for `Product`, `primaryDomain`, `MailingAddress` and `CreditCard` as they each use a different method to carry out the specs.

### Test Suite

To run solidus_graphql_api specs, invoke `rake`. `rake` will default to building a dummy app in `spec/dummy`, and finally running the specs.

```shell
bundle
bundle exec rake

# Or individually:
bundle exec rake test_app
bundle exec rake spec

# Or using rspec for tests directly:
bundle exec rspec
bundle exec rspec spec/graphql/types/product_spec.rb
```

## State of Implementation

- [x] Collection.description
- [x] Collection.handle
- [x] Collection.id
- [x] Collection.products(first, after, last, before, reverse, sortKey)
- [x] Collection.title
- [x] Collection.updatedAt
- [x] CreditCard.brand
- [x] CreditCard.expiryMonth
- [x] CreditCard.expiryYear
- [x] CreditCard.firstName
- [x] CreditCard.lastDigits
- [x] CreditCard.lastName
- [x] CreditCard.maskedNumber
- [x] Domain.host
- [x] Domain.sslEnabled
- [x] Domain.url
- [x] MailingAddress.address1
- [x] MailingAddress.address2
- [x] MailingAddress.city
- [x] MailingAddress.company
- [x] MailingAddress.country
- [x] MailingAddress.countryCodeV2
- [x] MailingAddress.firstName
- [x] MailingAddress.formattedArea
- [x] MailingAddress.id
- [x] MailingAddress.lastName
- [x] MailingAddress.name
- [x] MailingAddress.phone
- [x] MailingAddress.province
- [x] MailingAddress.provinceCode
- [x] MailingAddress.zip
- [x] Node.id
- [x] PageInfo.hasNextPage
- [x] PageInfo.hasPreviousPage
- [x] PaymentSettings.countryCode
- [x] PaymentSettings.currencyCode
- [x] Product.createdAt
- [x] Product.description
- [x] Product.handle
- [x] Product.id
- [x] Product.publishedAt
- [x] Product.title
- [x] Product.updatedAt
- [x] ProductVariant.id
- [x] ProductVariant.product
- [x] Product.variants(first, after, last, before, reverse, sortKey)
- [x] ProductVariant.sku
- [x] ProductVariant.title
- [x] ProductVariant.weight
- [x] QueryRoot.node(id)
- [x] QueryRoot.nodes(ids)
- [x] QueryRoot.shop
- [x] Shop.collectionByHandle(handle) - (works only for Spree taxons, not top-level taxonomies)
- [x] Shop.collections(first, after, last, before, reverse, sortKey, query) - (`query` not supported yet; returns top-level Spree taxonomies)
- [x] Shop.moneyFormat
- [x] Shop.paymentSettings
- [x] Shop.description
- [x] Shop.name
- [x] Shop.primaryDomain
- [x] Shop.productByHandle(handle)
- [x] Shop.products(first, after, last, before, reverse, sortKey, query) - (`query` not supported yet)
- [x] Shop.shipsToCountries


## Implementation Notes

This section contains notes related to implementation or behavior of some GraphQL fields:

1. Collections and Products. The upstream API has a concept of Collections which are nested product categories. In Solidus, these are implemented through top-level Taxonomies and contained Taxons. Taxonomies have a small number of fields, and cannot be nested. Taxons have a longer list of existing fields, can be nested, and more closely match the concept of Collections. Solidus' GraphQL implementation for Collections emulates them by transparently returning Taxonomies at the top level and Taxons at lower levels. However, more work is needed to make it fully transparent, and `collectionByHandle()` should be improved too. For more discussion about the approach itself, see https://github.com/solidusio-contrib/solidus_graphql_api/issues/25.
1. Domain.sslEnabled. This field returns value of `Rails.configuration.force_ssl` and so it does not accurately report whether SSL is "enabled", but whether it is "forced".
1. PaymentSettings.countryCode. Since the default `Spree::Store` model does not have a field for the store's address and country, the value of this field is coming from `Spree::Store#cart_tax_country_iso`, which in turn is the default country whose tax should be applied. Comments as to whether this is a good way to produce this value are welcome.
1. PaymentSettings.currencyCode. The value of this field is coming from `Spree::Store#default_currency` and so it does not necessarily represent the _only_ currency accepted, but just the _default_ one.
1. Shop.moneyFormat. There is no equivalent of this field in `Solidus` or `Spree::Money`, so the value is produced by running the formatting method on an example amount, and then guessing the money format template from that. The current implementation seems like it should cover a good number of use cases. However, check this value yourself to ensure it is correct in your setup.
1. Shop.shipsToCountries. In Solidus, this field does not exist anywhere out-of-the-box, but support for this is provided. To make this field return a meaningful result, one should create a Zone in Solidus Admin and add chosen countries in it. Then, in Solidus configuration, the setting `checkout_zone` should be set to name of that zone.

## TODO

The primary TODOs related to this extension are:

1. Add authentication (#14)
1. Add authorization (#15)
1. All other open issues (https://github.com/solidusio-contrib/solidus_graphql_api/issues)
