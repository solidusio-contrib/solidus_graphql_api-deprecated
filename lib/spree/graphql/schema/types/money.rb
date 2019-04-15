# frozen_string_literal: true

class Spree::GraphQL::Schema::Types::Money < Spree::GraphQL::Schema::Types::BaseObject
  description <<~MD
    A monetary value with currency.

    To format currencies, combine this type’s amount and currencyCode fields with your client’s locale.

    For example, in JavaScript you could use Intl.NumberFormat:

    ```js
    new Intl.NumberFormat(locale, {
      style: 'currency',
      currency: currencyCode
    }).format(amount);
    ```

    Other formatting libraries include:

    * iOS - [NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)
    * Android - [NumberFormat](https://developer.android.com/reference/java/text/NumberFormat.html)
    * PHP - [NumberFormatter](http://php.net/manual/en/class.numberformatter.php)

    For a more general solution, the [Unicode CLDR number formatting database] is available with many implementations
    (such as [TwitterCldr](https://github.com/twitter/twitter-cldr-rb)).
  MD

  field :amount, Spree::GraphQL::Schema::Types::Decimal, null: false do
    description 'Decimal money amount.'
  end
  field :currency_code, Spree::GraphQL::Schema::Types::CurrencyCode, null: false do
    description 'Currency of the money.'
  end
end
