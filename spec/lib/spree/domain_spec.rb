# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe 'Domain' do
    let!(:host1) { 'example.com' }
    let!(:host2) { 'test.org' }
    let!(:ssl1) { false }
    let!(:ssl2) { true }
    let!(:url1) { 'http://example.com' }
    let!(:url2) { 'https://test.org' }
    let!(:domain1) { ::Spree::Domain.new(host1, ssl1)}
    let!(:domain2) { ::Spree::Domain.new(host2, ssl2)}

    # host: The host name of the domain (eg: `example.com`).
    # @return [Types::String!]
    describe 'host' do
      it 'succeeds' do
        expect(domain1.host).to eq(host1)
        expect(domain2.host).to eq(host2)
      end
    end

    # sslEnabled: Whether SSL is enabled or not.
    # @return [Types::Boolean!]
    describe 'sslEnabled' do
      it 'succeeds' do
        expect(domain1.ssl_enabled).to eq(ssl1)
        expect(domain2.ssl_enabled).to eq(ssl2)
      end
    end

    # url: The URL of the domain (eg: `https://example.com`).
    # @return [Types::URL!]
    describe 'url' do
      it 'succeeds' do
        expect(domain1.url).to eq(url1)
        expect(domain2.url).to eq(url2)
      end
    end
  end
end
