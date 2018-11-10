class Spree::GraphQL::Schema::Types::MailingAddress < Spree::GraphQL::Schema::Types::BaseObjectNode
  graphql_name 'MailingAddress'
  description %q{Represents a mailing address for customers and shipping.}
  include ::Spree::GraphQL::Types::MailingAddress
  field :address1, ::GraphQL::Types::String, null: true do
    description %q{The first line of the address. Typically the street address or PO Box number.
}
  end
  field :address2, ::GraphQL::Types::String, null: true do
    description %q{The second line of the address. Typically the number of the apartment, suite, or unit.
}
  end
  field :city, ::GraphQL::Types::String, null: true do
    description %q{The name of the city, district, village, or town.
}
  end
  field :company, ::GraphQL::Types::String, null: true do
    description %q{The name of the customer's company or organization.
}
  end
  field :country, ::GraphQL::Types::String, null: true do
    description %q{The name of the country.
}
  end
  field :country_code_v2, ::Spree::GraphQL::Schema::Types::CountryCode, null: true do
    description %q{The two-letter code for the country of the address.

For example, US.
}
  end
  field :first_name, ::GraphQL::Types::String, null: true do
    description %q{The first name of the customer.}
  end
  field :formatted, [::GraphQL::Types::String], null: false do
    description %q{A formatted version of the address, customized by the provided arguments.}
    argument :with_name, ::GraphQL::Types::Boolean, required: false, default_value: false, description: %q{Whether to include the customer's name in the formatted address.}
    argument :with_company, ::GraphQL::Types::Boolean, required: false, default_value: true, description: %q{Whether to include the customer's company in the formatted address.}
  end
  field :formatted_area, ::GraphQL::Types::String, null: true do
    description %q{A comma-separated list of the values for city, province, and country.}
  end
  field :last_name, ::GraphQL::Types::String, null: true do
    description %q{The last name of the customer.}
  end
  field :latitude, ::GraphQL::Types::Float, null: true do
    description %q{The latitude coordinate of the customer address.}
  end
  field :longitude, ::GraphQL::Types::Float, null: true do
    description %q{The longitude coordinate of the customer address.}
  end
  field :name, ::GraphQL::Types::String, null: true do
    description %q{The full name of the customer, based on firstName and lastName.
}
  end
  field :phone, ::GraphQL::Types::String, null: true do
    description %q{A unique phone number for the customer.

Formatted using E.164 standard. For example, _+16135551111_.
}
  end
  field :province, ::GraphQL::Types::String, null: true do
    description %q{The region of the address, such as the province, state, or district.}
  end
  field :province_code, ::GraphQL::Types::String, null: true do
    description %q{The two-letter code for the region.

For example, ON.
}
  end
  field :zip, ::GraphQL::Types::String, null: true do
    description %q{The zip or postal code of the address.}
  end
end
