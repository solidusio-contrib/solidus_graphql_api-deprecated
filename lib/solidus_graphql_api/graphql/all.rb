require 'graphql'
require 'ostruct'
require 'action_view'

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

require_relative "./types/base_object"
require_relative "./types/base_enum"
require_relative "./types/base_scalar"
require_relative "./types/base_union"
require_relative "./types/page_info"
require_relative "./types/date_time"

require_relative "./types/discount_application_target_type"
require_relative "./types/discount_application_target_selection"
require_relative "./types/discount_application_allocation_method"
require_relative "./types/pricing_value"
require_relative "./interfaces/discount_application"
require_relative "./types/discount_code_application"
require_relative "./types/script_discount_application"
require_relative "./types/manual_discount_application"

require_relative "./types/country_code"
require_relative "./types/mailing_address"

require_relative "./types/decimal"
require_relative "./types/currency_code"
require_relative "./types/money_v2"
require_relative "./types/money"
require_relative "./types/applied_gift_card"
require_relative "./types/shipping_rate"
require_relative "./types/available_shipping_rates"
require_relative "./types/attribute"
require_relative "./types/discount_allocation"
require_relative "./types/url"
require_relative "./types/crop_region"
require_relative "./types/image_content_type"
require_relative "./types/image"
require_relative "./types/html"
require_relative "./types/product_collection_sort_keys"
require_relative "./types/collection"
require_relative "./types/product_image_sort_keys"
require_relative "./types/product_option"
require_relative "./types/product_variant_sort_keys"
require_relative "./types/product_price_range"
require_relative "./types/product_sort_keys"
require_relative "./types/selected_option"
require_relative "./types/weight_unit"
require_relative "./types/product_variant"
require_relative "./types/product"
require_relative "./types/checkout_line_item"
require_relative "./types/order_line_item"
require_relative "./types/fulfillment_line_item"
require_relative "./types/fulfillment_tracking_info"
require_relative "./types/fulfillment"
require_relative "./types/order"
require_relative "./types/checkout"
require_relative "./types/order_sort_keys"
require_relative "./types/customer"

require_relative "./interfaces/displayable_error"
require_relative "./types/customer_access_token"
require_relative "./types/customer_error_code"
require_relative "./types/customer_user_error"

require_relative "./types/checkout_error_code"
require_relative "./types/checkout_user_error"
require_relative "./types/transaction_status"
require_relative "./types/transaction_kind"
require_relative "./types/transaction"
require_relative "./types/credit_card"
require_relative "./types/payment"
require_relative "./types/user_error"
require_relative "./types/collection_sort_keys"
require_relative "./types/article_sort_keys"
require_relative "./types/blog_sort_keys"
require_relative "./types/comment_author"
require_relative "./types/comment"
require_relative "./types/article_author"
require_relative "./types/article"
require_relative "./types/blog"
require_relative "./types/shop_policy"
require_relative "./types/domain"
require_relative "./types/digital_wallet"
require_relative "./types/card_brand"
require_relative "./types/payment_settings"
require_relative "./types/shop"
require_relative "./types/pricing_percentage_value"

require_relative "./types/query_root"
require_relative "./types/mutation"

# Schema parts:

require_relative "./schema/types/base_object"
require_relative "./schema/types/base_object_node"
require_relative "./schema/types/base_enum"
require_relative "./schema/types/base_scalar"
require_relative "./schema/inputs/base_input"
require_relative "./schema/interfaces/base_interface"
require_relative "./schema/payloads/base_payload"
require_relative "./schema/types/base_union"
require_relative "./schema/types/page_info"
require_relative "./schema/types/date_time"

require_relative "./schema/types/discount_application_target_type"
require_relative "./schema/types/discount_application_target_selection"
require_relative "./schema/types/discount_application_allocation_method"
require_relative "./schema/types/pricing_value"
require_relative "./schema/interfaces/discount_application"
require_relative "./schema/types/discount_code_application"
require_relative "./schema/types/script_discount_application"
require_relative "./schema/types/manual_discount_application"

require_relative "./schema/types/country_code"
require_relative "./schema/types/mailing_address"

require_relative "./schema/types/decimal"
require_relative "./schema/types/currency_code"
require_relative "./schema/types/money_v2"
require_relative "./schema/types/money"
require_relative "./schema/types/applied_gift_card"
require_relative "./schema/types/shipping_rate"
require_relative "./schema/types/available_shipping_rates"
require_relative "./schema/types/attribute"
require_relative "./schema/types/discount_allocation"
require_relative "./schema/types/url"
require_relative "./schema/types/crop_region"
require_relative "./schema/types/image_content_type"
require_relative "./schema/types/image"
require_relative "./schema/types/html"
require_relative "./schema/types/product_collection_sort_keys"
require_relative "./schema/types/collection"
require_relative "./schema/types/product_image_sort_keys"
require_relative "./schema/types/product_option"
require_relative "./schema/types/product_variant_sort_keys"
require_relative "./schema/types/product_price_range"
require_relative "./schema/types/product_sort_keys"
require_relative "./schema/types/selected_option"
require_relative "./schema/inputs/selected_option"
require_relative "./schema/types/weight_unit"
require_relative "./schema/types/product_variant"
require_relative "./schema/types/product"
require_relative "./schema/types/checkout_line_item"
require_relative "./schema/types/order_line_item"
require_relative "./schema/types/fulfillment_line_item"
require_relative "./schema/types/fulfillment_tracking_info"
require_relative "./schema/types/fulfillment"
require_relative "./schema/types/order"
require_relative "./schema/types/checkout"
require_relative "./schema/types/order_sort_keys"
require_relative "./schema/types/customer"

require_relative "./schema/interfaces/displayable_error"
require_relative "./schema/types/customer_access_token"
require_relative "./schema/types/customer_error_code"
require_relative "./schema/types/customer_user_error"

require_relative "./schema/types/checkout_error_code"
require_relative "./schema/types/checkout_user_error"
require_relative "./schema/types/transaction_status"
require_relative "./schema/types/transaction_kind"
require_relative "./schema/types/transaction"
require_relative "./schema/types/credit_card"
require_relative "./schema/types/payment"
require_relative "./schema/types/user_error"
require_relative "./schema/payloads/checkout_complete_with_credit_card"
require_relative "./schema/payloads/checkout_attributes_update"
require_relative "./schema/types/collection_sort_keys"
require_relative "./schema/types/article_sort_keys"
require_relative "./schema/types/blog_sort_keys"
require_relative "./schema/types/comment_author"
require_relative "./schema/types/comment"
require_relative "./schema/types/article_author"
require_relative "./schema/types/article"
require_relative "./schema/types/blog"
require_relative "./schema/types/shop_policy"
require_relative "./schema/types/domain"
require_relative "./schema/types/digital_wallet"
require_relative "./schema/types/card_brand"
require_relative "./schema/types/payment_settings"
require_relative "./schema/types/shop"
require_relative "./schema/types/pricing_percentage_value"

require_relative "./schema/inputs/attribute"
require_relative "./schema/inputs/mailing_address"
require_relative "./schema/inputs/money"
require_relative "./schema/inputs/customer_update"
require_relative "./schema/inputs/customer_reset"
require_relative "./schema/inputs/customer_create"
require_relative "./schema/inputs/customer_activate"
require_relative "./schema/inputs/customer_access_token_create"
require_relative "./schema/inputs/checkout_line_item_update"
require_relative "./schema/inputs/checkout_line_item"
require_relative "./schema/inputs/checkout_create"
require_relative "./schema/inputs/tokenized_payment_v2"
require_relative "./schema/inputs/credit_card_payment_v2"
require_relative "./schema/inputs/checkout_attributes_update_v2"
require_relative "./schema/inputs/tokenized_payment"
require_relative "./schema/inputs/credit_card_payment"
require_relative "./schema/inputs/checkout_attributes_update"
require_relative "./schema/payloads/customer_update"
require_relative "./schema/payloads/customer_reset_by_url"
require_relative "./schema/payloads/customer_reset"
require_relative "./schema/payloads/customer_recover"
require_relative "./schema/payloads/customer_default_address_update"
require_relative "./schema/payloads/customer_create"
require_relative "./schema/payloads/customer_address_update"
require_relative "./schema/payloads/customer_address_delete"
require_relative "./schema/payloads/customer_address_create"
require_relative "./schema/payloads/customer_activate"
require_relative "./schema/payloads/customer_access_token_renew"
require_relative "./schema/payloads/customer_access_token_delete"
require_relative "./schema/payloads/customer_access_token_create"
require_relative "./schema/payloads/checkout_shipping_line_update"
require_relative "./schema/payloads/checkout_line_items_update"
require_relative "./schema/payloads/checkout_line_items_remove"
require_relative "./schema/payloads/checkout_line_items_add"
require_relative "./schema/payloads/checkout_gift_cards_append"
require_relative "./schema/payloads/checkout_discount_code_remove"
require_relative "./schema/payloads/checkout_create"
require_relative "./schema/payloads/checkout_complete_free"
require_relative "./schema/payloads/checkout_customer_associate_v2"
require_relative "./schema/payloads/checkout_complete_with_tokenized_payment_v2"
require_relative "./schema/payloads/checkout_complete_with_credit_card_v2"
require_relative "./schema/payloads/checkout_attributes_update_v2"
require_relative "./schema/payloads/checkout_shipping_address_update"
require_relative "./schema/payloads/checkout_gift_card_remove"
require_relative "./schema/payloads/checkout_gift_card_apply"
require_relative "./schema/payloads/checkout_email_update"
require_relative "./schema/payloads/checkout_discount_code_apply"
require_relative "./schema/payloads/checkout_customer_disassociate"
require_relative "./schema/payloads/checkout_customer_associate"
require_relative "./schema/payloads/checkout_complete_with_tokenized_payment"

require_relative "./schema/types/query_root"
require_relative "./schema/types/mutation"
require_relative "./schema/schema"
