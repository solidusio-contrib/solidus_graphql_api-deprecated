describe 'Types' do
  describe 'Product' do
    let!(:products) {create_list(:product, 2)}
    let!(:inactive_product) {create(:product, available_on: Time.current.tomorrow, name: 'inactive')}

    it 'Returns available products' do
      query = <<-GRAPHQL
      {
        products {
          name
        }
      }
      GRAPHQL

      response = Spree::GraphQL::Schema.execute(query)
      result = response.dig('data', 'products')
      expect(result.count).to eq(2)
      expect(result.map {|node| node[:name]}).to_not include(inactive_product.name)
    end
  end

  describe 'Product with variants' do
    let!(:variant_product) {create(:variant)}
    it 'returns variant data when a product with variants is fetched' do

      query= <<-GRAPHQL
      {
        products{
          id
          name
          variants {
            id
            name
          }
        }
      }
      GRAPHQL
  
      response = Spree::GraphQL::Schema.execute(query)
      result = response.dig('data', 'products', 0)
      expect(result['name']).to eq(result['variants'][0]['name'])
    end
  end
end
