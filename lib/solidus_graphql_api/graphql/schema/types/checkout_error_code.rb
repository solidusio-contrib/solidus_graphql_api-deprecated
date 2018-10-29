class Spree::GraphQL::Schema::Types::CheckoutErrorCode < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'CheckoutErrorCode'
  description %q{Possible error codes that could be returned by a checkout mutation.}
  include ::Spree::GraphQL::Types::CheckoutErrorCode
  value 'BLANK', %q{Input value is blank.}
  value 'INVALID', %q{Input value is invalid.}
  value 'TOO_LONG', %q{Input value is too long.}
  value 'PRESENT', %q{Input value is not present.}
  value 'LESS_THAN', %q{Input value should be less than maximum allowed value.}
  value 'ALREADY_COMPLETED', %q{Checkout is already completed.}
  value 'LOCKED', %q{Checkout is locked.}
  value 'NOT_SUPPORTED', %q{Input value is not supported.}
  value 'INVALID_FOR_COUNTRY_AND_PROVINCE', %q{Input Zip is invalid for country and province provided.}
  value 'INVALID_STATE_IN_COUNTRY', %q{Invalid state in country.}
  value 'INVALID_PROVINCE_IN_COUNTRY', %q{Invalid province in country.}
  value 'INVALID_REGION_IN_COUNTRY', %q{Invalid region in country.}
  value 'SHIPPING_RATE_EXPIRED', %q{Shipping rate expired.}
  value 'GIFT_CARD_UNUSABLE', %q{Gift card unusable.}
  value 'CART_DOES_NOT_MEET_DISCOUNT_REQUIREMENTS_NOTICE', %q{Cart does not meet discount requirements notice.}
  value 'DISCOUNT_EXPIRED', %q{Discount expired.}
  value 'DISCOUNT_DISABLED', %q{Discount disabled.}
  value 'DISCOUNT_LIMIT_REACHED', %q{Discount limit reached.}
  value 'DISCOUNT_NOT_FOUND', %q{Discount not found.}
  value 'CUSTOMER_ALREADY_USED_ONCE_PER_CUSTOMER_DISCOUNT_NOTICE', %q{Customer already used once per customer discount notice.}
  value 'EMPTY', %q{Checkout is already completed.}
  value 'NOT_ENOUGH_IN_STOCK', %q{Not enough in stock.}
end