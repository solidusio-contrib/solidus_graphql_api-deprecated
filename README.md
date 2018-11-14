# Solidus GraphQL API

NOTE: This is a work in progress. Please join the Solidus Slack #graphql channel at [https://solidusio.slack.com/](https://solidusio.slack.com/) if you are interested.

The complete list of Solidus GraphQL calls and their implementation status can be found below, towards the end of the document.


## Installation

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

## Testing and Usage

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

Please note that all GraphQL API fields which do not yet contain an actual implementation will return a `NotImplementedError`. For all such fields that you attempt to use but they aren't available, please submit an issue or report them in Solidus Slack channel #graphql. That will help prioritize work and ensure we begin with the implementation on the next working day.

## How to Contribute

In solidus_graphql_api, GraphQL files are located in directory `lib/solidus_graphql_api/graphql/`. That directory is further divided into two parts:

1. The schema part, i.e. the files kept in the subdirectory `schema/`
1. The implementation part, i.e. all other files outside of the subdirectory `schema/`

And additionally, there is also top-level directory `spec/` with all the tests.

For maximum convenience, all those files come with pre-generated, template content. The `schema/` files are not intended to be modified by users, so for implementation you will need to use only two locations &mdash; the implementation files and tests.

To e.g. implement `Order.totalTax`, you would do as follows:

1. Add code to pre-defined location in file `./lib/solidus_graphql_api/graphql/types/order.rb`
1. Modify test in pre-defined location in file `./spec/graphql/types/order_spec.rb`
1. After enabling at least one `it` block in the test file, run rspec on it &mdash; `rspec ./spec/graphql/types/order_spec.rb`
1. After tests pass, update `README.md` to mark new GraphQL calls as implemented and submit a PR

Notes / additional help on adding code and tests follow:

### Adding GraphQL Field Implementations

As you might know, every GraphQL field returns either an object for more querying on it, or a leaf value.

For example, a query such as `{ shop { primaryDomain { url }}}` expects `QueryRoot.shop` to return an instance of `Shop`, `shop.primaryDomain` to return an instance of `Domain`, and finally `primaryDomain.url` to return the leaf value containing the URL. If it happens that non-leaf fields return a leaf value (or leaf fields return a non-leaf value), an error is raised.

In the simplest cases, especially those in which the created GraphQL types have direct equivalents in Solidus core, the implementations can be trivial. For example, for `{ shop { name }}`, `shop` may just return an instance of `Spree::Store` and `name` may just call `name` on that instance.

Sometimes, however, types do not have direct mappings. For example, GraphQL type `Domain` has fields `host`, `sslEnabled`, and `url`. It does not have a direct equivalent in Solidus, and it is not backed by a database. However, we know we can put this information together; `host` by calling `Spree::Store#url`, `sslEnabled` by querying `Rails.configuration.force_ssl`, and `url` by concatenating the protocol and host together. The only thing left to do then is to decide where to put this code.

Option 1: for insignificant, disposable types, we can add implementation directly in the GraphQL method for `shop.primaryDomain` (`./lib/solidus_graphql_api/graphql/types/shop.rb`):

```
require 'ostruct'
def primaryDomain()
  ssl = Rails.configuration.force_ssl
  url_prefix = ssl ? 'https://' : 'http://'

  OpenStruct.new \
    host: object.url,
    ssl_enabled: ssl,
    url: url_prefix + object.url
end
```

Option 2: for more important types which may be created and have additional methods defined on them, we can create a Ruby class (`./lib/spree/domain.rb`) and instantiate it from `primaryDomain`:

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

(If a type is backed by a database and represents a model, `app/models/` would be used instead of `lib/spree/`.)

### Adding Corresponding tests

As mentioned, tests come with pre-defined template code as well.

The header of each test defines the GraphQL query and expected result, followed by an `it` block which actually runs the query and comparison.

The pre-generated code and placeholders are verbose and detailed. It is easier to delete parts of content that won't be needed in a test than to write large parts of queries and code manually.

The command to execute queries is just `execute`. It runs `Schema.execute()` with defaulting to `query()`, `context()` and `variables()` unless these params are manually provided.

After the query is executed, the response is available through `response()` as usual.

For it, there are helpers defined &mdash; `response_json()` to get JSON string of the response, and `response_hash()` to get Ruby hash of the response.

For the expected result, there are analogously-named helpers defined on it: `result_json()` and `result_hash()`.

So, to match the response to the expected result, one can use either of the following methods, regardless of the format in which the response and result were originally given:

```
expect(response_json).to eq(result_json)

expect(response_hash).to eq(result_hash)
```

For helper types and classes which are not directly accessible from the outside (such as type `Domain`), it is not necessary to make GraphQL calls but classes themselves can be tested. Please see the spec files for examples.

### Test Suite

To run solidus_graphql_api tests, invoke `rake`. `rake` will default to building a dummy app in `spec/dummy`, and finally running the specs.

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

- [ ] AppliedGiftCard.amountUsed
- [ ] AppliedGiftCard.balance
- [ ] AppliedGiftCard.id
- [ ] AppliedGiftCard.lastCharacters
- [ ] ArticleAuthor.bio
- [ ] ArticleAuthor.email
- [ ] ArticleAuthor.firstName
- [ ] ArticleAuthor.lastName
- [ ] ArticleAuthor.name
- [ ] Article.authorV2
- [ ] Article.blog
- [ ] Article.comments(first, after, last, before, reverse)
- [ ] Article.contentHtml
- [ ] Article.content(truncateAt)
- [ ] Article.excerptHtml
- [ ] Article.excerpt(truncateAt)
- [ ] Article.handle
- [ ] Article.id
- [ ] Article.image(maxWidth, maxHeight, crop, scale)
- [ ] Article.publishedAt
- [ ] Article.tags
- [ ] Article.title
- [ ] Article.url
- [ ] Attribute.key
- [ ] Attribute.value
- [ ] AvailableShippingRates.ready
- [ ] AvailableShippingRates.shippingRates
- [ ] Blog.articleByHandle(handle)
- [ ] Blog.articles(first, after, last, before, reverse)
- [ ] Blog.authors
- [ ] Blog.handle
- [ ] Blog.id
- [ ] Blog.title
- [ ] Blog.url
- [ ] Checkout.appliedGiftCards
- [ ] Checkout.availableShippingRates
- [ ] Checkout.completedAt
- [ ] Checkout.createdAt
- [ ] Checkout.currencyCode
- [ ] Checkout.customAttributes
- [ ] Checkout.discountApplications(first, after, last, before, reverse)
- [ ] Checkout.email
- [ ] Checkout.id
- [ ] CheckoutLineItem.customAttributes
- [ ] CheckoutLineItem.discountAllocations
- [ ] CheckoutLineItem.id
- [ ] CheckoutLineItem.quantity
- [ ] Checkout.lineItems(first, after, last, before, reverse)
- [ ] CheckoutLineItem.title
- [ ] CheckoutLineItem.variant
- [ ] Checkout.note
- [ ] Checkout.order
- [ ] Checkout.orderStatusUrl
- [ ] Checkout.paymentDue
- [ ] Checkout.ready
- [ ] Checkout.requiresShipping
- [ ] Checkout.shippingAddress
- [ ] Checkout.shippingDiscountAllocations
- [ ] Checkout.shippingLine
- [ ] Checkout.subtotalPrice
- [ ] Checkout.taxesIncluded
- [ ] Checkout.taxExempt
- [ ] Checkout.totalPrice
- [ ] Checkout.totalTax
- [ ] Checkout.updatedAt
- [ ] CheckoutUserError.code
- [ ] CheckoutUserError.field
- [ ] CheckoutUserError.message
- [ ] Checkout.webUrl
- [x] Collection.descriptionHtml
- [x] Collection.description(truncateAt)
- [x] Collection.handle
- [x] Collection.id
- [ ] Collection.image(maxWidth, maxHeight, crop, scale)
- [x] Collection.products(first, after, last, before, reverse, sortKey)
- [x] Collection.title
- [x] Collection.updatedAt
- [ ] Comment.author
- [ ] CommentAuthor.email
- [ ] CommentAuthor.name
- [ ] Comment.contentHtml
- [ ] Comment.content(truncateAt)
- [ ] Comment.id
- [ ] CreditCard.brand
- [ ] CreditCard.expiryMonth
- [ ] CreditCard.expiryYear
- [ ] CreditCard.firstDigits
- [ ] CreditCard.firstName
- [ ] CreditCard.lastDigits
- [ ] CreditCard.lastName
- [ ] CreditCard.maskedNumber
- [ ] Customer.acceptsMarketing
- [ ] CustomerAccessToken.accessToken
- [ ] CustomerAccessToken.expiresAt
- [ ] Customer.addresses(first, after, last, before, reverse)
- [ ] Customer.createdAt
- [ ] Customer.defaultAddress
- [ ] Customer.displayName
- [ ] Customer.email
- [ ] Customer.firstName
- [ ] Customer.id
- [ ] Customer.lastIncompleteCheckout
- [ ] Customer.lastName
- [ ] Customer.orders(first, after, last, before, reverse, sortKey, query)
- [ ] Customer.phone
- [ ] Customer.updatedAt
- [ ] CustomerUserError.code
- [ ] CustomerUserError.field
- [ ] CustomerUserError.message
- [ ] DiscountAllocation.allocatedAmount
- [ ] DiscountAllocation.discountApplication
- [ ] DiscountApplication.allocationMethod
- [ ] DiscountApplication.targetSelection
- [ ] DiscountApplication.targetType
- [ ] DiscountApplication.value
- [ ] DiscountCodeApplication.allocationMethod
- [ ] DiscountCodeApplication.applicable
- [ ] DiscountCodeApplication.code
- [ ] DiscountCodeApplication.targetSelection
- [ ] DiscountCodeApplication.targetType
- [ ] DiscountCodeApplication.value
- [ ] DisplayableError.field
- [ ] DisplayableError.message
- [x] Domain.host
- [x] Domain.sslEnabled
- [x] Domain.url
- [ ] Fulfillment.fulfillmentLineItems(first, after, last, before, reverse)
- [ ] FulfillmentLineItem.lineItem
- [ ] FulfillmentLineItem.quantity
- [ ] Fulfillment.trackingCompany
- [ ] Fulfillment.trackingInfo(first)
- [ ] FulfillmentTrackingInfo.number
- [ ] FulfillmentTrackingInfo.url
- [ ] Image.altText
- [ ] Image.id
- [ ] Image.originalSrc
- [ ] Image.transformedSrc(maxWidth, maxHeight, crop, scale, preferredContentType)
- [ ] MailingAddress.address1
- [ ] MailingAddress.address2
- [ ] MailingAddress.city
- [ ] MailingAddress.company
- [ ] MailingAddress.country
- [ ] MailingAddress.countryCodeV2
- [ ] MailingAddress.firstName
- [ ] MailingAddress.formattedArea
- [ ] MailingAddress.formatted(withName, withCompany)
- [ ] MailingAddress.id
- [ ] MailingAddress.lastName
- [ ] MailingAddress.latitude
- [ ] MailingAddress.longitude
- [ ] MailingAddress.name
- [ ] MailingAddress.phone
- [ ] MailingAddress.province
- [ ] MailingAddress.provinceCode
- [ ] MailingAddress.zip
- [ ] ManualDiscountApplication.allocationMethod
- [ ] ManualDiscountApplication.description
- [ ] ManualDiscountApplication.targetSelection
- [ ] ManualDiscountApplication.targetType
- [ ] ManualDiscountApplication.title
- [ ] ManualDiscountApplication.value
- [ ] MoneyV2.amount
- [ ] MoneyV2.currencyCode
- [ ] Mutation.checkoutAttributesUpdateV2(checkoutId, input)
- [ ] Mutation.checkoutCompleteFree(checkoutId)
- [ ] Mutation.checkoutCompleteWithCreditCardV2(checkoutId, payment)
- [ ] Mutation.checkoutCompleteWithTokenizedPaymentV2(checkoutId, payment)
- [ ] Mutation.checkoutCreate(input)
- [ ] Mutation.checkoutCustomerAssociateV2(checkoutId, customerAccessToken)
- [ ] Mutation.checkoutCustomerDisassociate(checkoutId)
- [ ] Mutation.checkoutDiscountCodeApply(discountCode, checkoutId)
- [ ] Mutation.checkoutDiscountCodeRemove(checkoutId)
- [ ] Mutation.checkoutEmailUpdate(checkoutId, email)
- [ ] Mutation.checkoutGiftCardRemove(appliedGiftCardId, checkoutId)
- [ ] Mutation.checkoutGiftCardsAppend(giftCardCodes, checkoutId)
- [ ] Mutation.checkoutLineItemsAdd(lineItems, checkoutId)
- [ ] Mutation.checkoutLineItemsRemove(checkoutId, lineItemIds)
- [ ] Mutation.checkoutLineItemsUpdate(checkoutId, lineItems)
- [ ] Mutation.checkoutShippingAddressUpdate(shippingAddress, checkoutId)
- [ ] Mutation.checkoutShippingLineUpdate(checkoutId, shippingRateHandle)
- [ ] Mutation.customerAccessTokenCreate(input)
- [ ] Mutation.customerAccessTokenDelete(customerAccessToken)
- [ ] Mutation.customerAccessTokenRenew(customerAccessToken)
- [ ] Mutation.customerActivate(id, input)
- [ ] Mutation.customerAddressCreate(customerAccessToken, address)
- [ ] Mutation.customerAddressDelete(id, customerAccessToken)
- [ ] Mutation.customerAddressUpdate(customerAccessToken, id, address)
- [ ] Mutation.customerCreate(input)
- [ ] Mutation.customerDefaultAddressUpdate(customerAccessToken, addressId)
- [ ] Mutation.customerRecover(email)
- [ ] Mutation.customerResetByUrl(resetUrl, password)
- [ ] Mutation.customerReset(id, input)
- [ ] Mutation.customerUpdate(customerAccessToken, customer)
- [x] Node.id
- [ ] Order.currencyCode
- [ ] Order.customerLocale
- [ ] Order.customerUrl
- [ ] Order.discountApplications(first, after, last, before, reverse)
- [ ] Order.email
- [ ] Order.id
- [ ] OrderLineItem.customAttributes
- [ ] OrderLineItem.discountAllocations
- [ ] OrderLineItem.quantity
- [ ] Order.lineItems(first, after, last, before, reverse)
- [ ] OrderLineItem.title
- [ ] OrderLineItem.variant
- [ ] Order.name
- [ ] Order.orderNumber
- [ ] Order.phone
- [ ] Order.processedAt
- [ ] Order.shippingAddress
- [ ] Order.shippingDiscountAllocations
- [ ] Order.statusUrl
- [ ] Order.subtotalPrice
- [ ] Order.successfulFulfillments(first)
- [ ] Order.totalPrice
- [ ] Order.totalRefunded
- [ ] Order.totalShippingPrice
- [ ] Order.totalTax
- [x] PageInfo.hasNextPage
- [x] PageInfo.hasPreviousPage
- [ ] Payment.amount
- [ ] Payment.billingAddress
- [ ] Payment.checkout
- [ ] Payment.creditCard
- [ ] Payment.errorMessage
- [ ] Payment.id
- [ ] Payment.idempotencyKey
- [ ] Payment.ready
- [ ] PaymentSettings.acceptedCardBrands
- [ ] PaymentSettings.cardVaultUrl
- [ ] PaymentSettings.countryCode
- [ ] PaymentSettings.currencyCode
- [ ] PaymentSettings.solidusPaymentsAccountId
- [ ] PaymentSettings.supportedDigitalWallets
- [ ] Payment.test
- [ ] Payment.transaction
- [ ] PricingPercentageValue.percentage
- [ ] Product.availableForSale
- [ ] Product.collections(first, after, last, before, reverse)
- [x] Product.createdAt
- [x] Product.descriptionHtml
- [x] Product.description(truncateAt)
- [x] Product.handle
- [x] Product.id
- [ ] Product.images(first, after, last, before, reverse, sortKey, maxWidth, maxHeight, crop, scale)
- [ ] Product.onlineStoreUrl
- [ ] ProductOption.id
- [ ] ProductOption.name
- [ ] Product.options(first)
- [ ] ProductOption.values
- [ ] Product.priceRange
- [ ] ProductPriceRange.maxVariantPrice
- [ ] ProductPriceRange.minVariantPrice
- [ ] Product.productType - not applicable for now (no such field on Product model)
- [x] Product.publishedAt
- [ ] Product.tags
- [x] Product.title
- [x] Product.updatedAt
- [ ] ProductVariant.availableForSale
- [ ] Product.variantBySelectedOptions(selectedOptions)
- [ ] ProductVariant.compareAtPrice
- [x] ProductVariant.id
- [ ] ProductVariant.image(maxWidth, maxHeight, crop, scale)
- [ ] ProductVariant.price
- [x] ProductVariant.product
- [ ] ProductVariant.selectedOptions
- [x] Product.variants(first, after, last, before, reverse, sortKey)
- [x] ProductVariant.sku
- [x] ProductVariant.title
- [x] ProductVariant.weight
- [ ] ProductVariant.weightUnit
- [ ] Product.vendor
- [ ] QueryRoot.articles(first, after, last, before, reverse, sortKey, query)
- [ ] QueryRoot.blogByHandle(handle)
- [ ] QueryRoot.blogs(first, after, last, before, reverse, sortKey, query)
- [ ] QueryRoot.customer(customerAccessToken)
- [x] QueryRoot.node(id)
- [x] QueryRoot.nodes(ids)
- [x] QueryRoot.shop
- [ ] ScriptDiscountApplication.allocationMethod
- [ ] ScriptDiscountApplication.description
- [ ] ScriptDiscountApplication.targetSelection
- [ ] ScriptDiscountApplication.targetType
- [ ] ScriptDiscountApplication.value
- [ ] SelectedOption.name
- [ ] SelectedOption.value
- [ ] ShippingRate.handle
- [ ] ShippingRate.price
- [ ] ShippingRate.title
- [x] Shop.collectionByHandle(handle) - (works only for Spree taxons, not top-level taxonomies)
- [x] Shop.collections(first, after, last, before, reverse, sortKey, query) - (`query` not supported yet; returns top-level Spree taxonomies)
- [x] Shop.moneyFormat
- [ ] Shop.paymentSettings
- [ ] ShopPolicy.body
- [ ] ShopPolicy.id
- [ ] ShopPolicy.title
- [ ] ShopPolicy.url
- [x] Shop.description
- [x] Shop.name
- [x] Shop.primaryDomain
- [ ] Shop.privacyPolicy
- [x] Shop.productByHandle(handle)
- [x] Shop.products(first, after, last, before, reverse, sortKey, query) - (`query` not supported yet)
- [ ] Shop.productTypes(first) - not applicable for now (no such field on Product model)
- [ ] Shop.refundPolicy
- [x] Shop.shipsToCountries
- [ ] Shop.termsOfService
- [ ] Transaction.amount
- [ ] Transaction.kind
- [ ] Transaction.status
- [ ] Transaction.test
- [ ] UserError.field
- [ ] UserError.message

## TODO

The primary TODOs related to this extension are:

1. Add authentication (#14)
1. Add authorization (#15)
1. Add remaining missing implementations from the above list
1. "Collections" can be nested, and so they are currently based on Taxons, ignoring Taxonomies. `Collections` returns all top-level taxons regardless of taxonomy they belong to. List of desired taxonomies to search in should be configurable. More detailed discussion is in #25.
1. Any other open issues
