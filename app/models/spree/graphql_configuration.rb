module Spree
  class GraphqlConfiguration < Preferences::Configuration
    preference :requires_authentication, :boolean, default: true
  end
end
