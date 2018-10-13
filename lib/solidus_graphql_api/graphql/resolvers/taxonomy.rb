module Spree
  module GraphQL
    module Resolvers
      class Taxonomy
        class All
          def self.call(obj, args, ctx)
            # TODO: query(args)
            Spree::Taxonomy.all
          end
        end
      end
    end
  end
end
