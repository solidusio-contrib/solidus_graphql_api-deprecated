describe 'Types' do
  describe 'Taxon' do
    let!(:taxon) {create(:taxon)}

    it 'Returns available taxons' do
      query = <<-GRAPHQL
      {
        taxonomies {
          taxons {
            name
          }
        }
      }
      GRAPHQL

      response = Spree::GraphQL::Schema.execute(query)
      result = response.dig('data', 'taxonomies', 0, 'taxons', 1)
      expect(result['name']).to eq 'Ruby on Rails'
    end
  end
end
