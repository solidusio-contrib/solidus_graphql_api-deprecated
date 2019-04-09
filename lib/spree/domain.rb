# frozen_string_literal: true

module Spree
  class Domain
    attr_reader :host, :ssl_enabled, :url

    def initialize(host, ssl_enabled, url = nil)
      @host = host
      @ssl_enabled = ssl_enabled
      @url = url || ((@ssl_enabled ? 'https://' : 'http://') + @host)
    end
  end
end
