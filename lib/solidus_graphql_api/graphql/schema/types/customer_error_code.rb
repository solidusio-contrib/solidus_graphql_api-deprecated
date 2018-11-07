class Spree::GraphQL::Schema::Types::CustomerErrorCode < Spree::GraphQL::Schema::Types::BaseEnum
  graphql_name 'CustomerErrorCode'
  description %q{Possible error codes that could be returned by a customer mutation.}
  include ::Spree::GraphQL::Types::CustomerErrorCode
  value 'BLANK', %q{Input value is blank.}
  value 'INVALID', %q{Input value is invalid.}
  value 'TAKEN', %q{Input value is already taken.}
  value 'TOO_LONG', %q{Input value is too long.}
  value 'TOO_SHORT', %q{Input value is too short.}
  value 'UNIDENTIFIED_CUSTOMER', %q{Unidentified customer.}
  value 'CUSTOMER_DISABLED', %q{Customer is disabled.}
  value 'PASSWORD_STARTS_OR_ENDS_WITH_WHITESPACE', %q{Input password starts or ends with whitespace.}
  value 'CONTAINS_HTML_TAGS', %q{Input contains HTML tags.}
  value 'CONTAINS_URL', %q{Input contains URL.}
end