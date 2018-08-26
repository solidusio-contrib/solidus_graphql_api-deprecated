module Solidus
  module GraphQL
    class TaxonomyResolver
      class All
        def self.call(obj, args, ctx)
          # TODO: query(args)
          Spree::Taxonomy.all
        end
      end
    end
  end
end
