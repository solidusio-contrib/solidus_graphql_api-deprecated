module Spree
  module GraphQL
    class AddressType < ::GraphQL::Schema::Object
      graphql_name "Address"

      field :firstname, String, null: false
      field :lastname, String, null: true
      field :address1, String, null: true
      field :address2, String, null: true
      field :city, String, null: true
      field :zipcode, String, null: true
      field :phone, String, null: false
      field :state, String, null: false
      field :country, String, null: false
    end
  end

end