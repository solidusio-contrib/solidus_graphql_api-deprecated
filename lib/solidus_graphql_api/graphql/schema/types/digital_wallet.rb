class Spree::GraphQL::Schema::Types::DigitalWallet < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'DigitalWallet'
  description %q{Digital wallet, such as Apple Pay, which can be used for accelerated checkouts.}
  include ::Spree::GraphQL::Types::DigitalWallet
  value 'APPLE_PAY', %q{Apple Pay}
  value 'ANDROID_PAY', %q{Android Pay}
  value 'GOOGLE_PAY', %q{Google Pay}
  value 'SOLIDUS_PAY', %q{Solidus Pay}
end