module Spree::GraphQL::Types::Shop


  # Field: description: A description of the shop.
  # Args: 
  # Returns: Types::String
  def description()
    object.meta_description
  end

  # Field: name: The shop’s name.
  # Args: 
  # Returns: Types::String!
  def name()
    object.name
  end

end

