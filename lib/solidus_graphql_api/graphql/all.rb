
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
require_relative './types/address'
require_relative './types/currency'
require_relative './types/price'
require_relative './types/option_value'
require_relative './types/option'
require_relative './types/payment'
require_relative './types/style'
require_relative './types/attachment'
require_relative './types/image'
require_relative './types/product'
require_relative './types/variant'
require_relative './types/order'
require_relative './types/line_item'


#queries
require_relative './types/query'

#mutations

require_relative './mutations/base_mutation'
require_relative './mutations/order_mutation'
require_relative './types/mutation'

