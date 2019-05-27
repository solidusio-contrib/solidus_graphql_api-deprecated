# frozen_string_literal: true

RSpec.shared_context 'when the lazy resolver adapter is BatchLoader' do
  before do
    SolidusGraphqlApi::Config.lazy_resolver_adapter_class_name =
      'Spree::GraphQL::LazyResolver::Adapters::BatchLoaderAdapter'
  end
end
