module Spree::GraphQL::Types::QueryRoot


  # Field: shop
  # Args: 
  # Returns: Types::Shop!
  def shop()
    ::Spree::Store.where(default: true).first
  end

end

