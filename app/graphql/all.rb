
require_relative './types/base_object'

#Resolvers
require_relative './resolvers/product_resolver'
require_relative './resolvers/variant_resolver'
require_relative './resolvers/user_resolver'
require_relative './resolvers/line_item_resolver'
require_relative './resolvers/order_resolver'
require_relative './resolvers/address_resolver'
require_relative './resolvers/shipment_method_resolver'
require_relative './resolvers/payment_method_resolver'
require_relative './resolvers/address_resolver'
require_relative './resolvers/payment_resolver'

#Types
require_relative './types/shipment_method'
require_relative './types/payment_method'
require_relative './types/address_type'
require_relative './types/currency_type'
require_relative './types/price_type'
require_relative './types/option_value_type'
require_relative './types/option_type'
require_relative './types/payment_type'
require_relative './types/style_type'
require_relative './types/attachment_type'
require_relative './types/image_type'
require_relative './types/product_type'
require_relative './types/variant_type'
require_relative './types/order_type'


#queries
require_relative './types/query_type'

#mutations

require_relative './mutations/base_mutation'
require_relative './mutations/order_mutation'
require_relative './types/mutation_type'

