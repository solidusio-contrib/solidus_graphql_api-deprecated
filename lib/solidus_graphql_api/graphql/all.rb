require 'graphql'
require 'ostruct'

module Spree
  module GraphQL

    module Schema
      module Inputs
      end
      module Interfaces
      end
      module Payloads
      end
      module Types
      end
    end

    module Inputs
    end
    module Interfaces
    end
    module Payloads
    end
    module Types
    end

    class NotImplementedError < ::GraphQL::ExecutionError
      def initialize
        super "Not implemented yet"
      end
    end
  end
end

# When requiring new files, please remember that most files need to be added
# to both "Implemntation part" and "Schema part" listed further below.

# Implementation parts:

require_relative "./types/mailing_address"

require_relative "./types/product_collection_sort_keys"
require_relative "./types/collection"
require_relative "./types/product_variant_sort_keys"
require_relative "./types/product_sort_keys"
require_relative "./types/product_variant"
require_relative "./types/product"

require_relative "./types/credit_card"
require_relative "./types/domain"
require_relative "./types/payment_settings"
require_relative "./types/shop"

require_relative "./types/query_root"

# Schema parts:

require_relative "./schema/types/base_object"
require_relative "./schema/types/base_object_node"
require_relative "./schema/types/base_enum"
require_relative "./schema/types/base_scalar"
require_relative "./schema/inputs/base_input"
require_relative "./schema/interfaces/base_interface"
require_relative "./schema/payloads/base_payload"
require_relative "./schema/types/base_union"
require_relative "./schema/types/date_time"

require_relative "./schema/types/country_code"
require_relative "./schema/types/mailing_address"

require_relative "./schema/types/decimal"
require_relative "./schema/types/currency_code"
require_relative "./schema/types/url"
require_relative "./schema/types/html"
require_relative "./schema/types/product_collection_sort_keys"
require_relative "./schema/types/collection"
require_relative "./schema/types/product_variant_sort_keys"
require_relative "./schema/types/product_sort_keys"
require_relative "./schema/types/product_variant"
require_relative "./schema/types/product"

require_relative "./schema/types/credit_card"
require_relative "./schema/types/collection_sort_keys"
require_relative "./schema/types/domain"
require_relative "./schema/types/payment_settings"
require_relative "./schema/types/shop"

require_relative "./schema/types/query_root"
require_relative "./schema/types/mutation"
require_relative "./schema/schema"
