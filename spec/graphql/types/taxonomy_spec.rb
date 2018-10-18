describe 'Types' do
  describe 'Taxonomy' do
    let!(:taxonomies) {[create(:taxonomy), create(:taxonomy, name: 'Category')]}

    it 'Returns available taxonomies' do
      query = <<-GRAPHQL
      {
        taxonomies {
          name
        }
      }
      GRAPHQL

      response = Spree::GraphQL::Schema.execute(query)
      result = response.dig('data', 'taxonomies')
      expect(result).to eq [{'name'=>'Brand'}, {'name'=>'Category'}]
    end
  end
end
