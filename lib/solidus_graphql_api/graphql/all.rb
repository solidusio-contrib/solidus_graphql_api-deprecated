require 'graphql'

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

require_relative "./types/base_object.rb"
require_relative "./types/base_enum.rb"
require_relative "./types/base_scalar.rb"
require_relative "./types/base_input.rb"
require_relative "./types/base_interface.rb"
require_relative "./types/base_union.rb"

require_relative "./types/shop.rb"

require_relative "./types/query_root.rb"

# Schema parts:

require_relative "./schema/types/base_object.rb"
require_relative "./schema/types/base_enum.rb"
require_relative "./schema/types/base_scalar.rb"
require_relative "./schema/types/base_input.rb"
require_relative "./schema/types/base_interface.rb"
require_relative "./schema/types/base_union.rb"

require_relative "./schema/types/shop.rb"

require_relative "./schema/types/query_root.rb"
require_relative "./schema/schema.rb"
