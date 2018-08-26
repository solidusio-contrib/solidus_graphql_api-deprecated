module Solidus
  module GraphQL
    class OptionTypeResolver
      class All
        def self.call(obj, args, ctx)
             Spree::OptionType.all
        end
      end

      class ByProduct
        def self.call(product, args, ctx)
          # TODO: query(args)
          product.option_types
        end
      end

    end
  end
end