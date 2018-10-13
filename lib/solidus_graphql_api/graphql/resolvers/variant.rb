module Spree
  module GraphQL
    class VariantResolver
      class ByProduct
        def self.call(product, args, ctx)
          # TODO: query(args)
          product.variants.to_a
        end
      end


       class ByLineItem
         def self.call(line_item,args,ctx)
           line_item.variant
         end

       end
    end
  end
end
