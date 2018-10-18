describe 'Mutations' do
  let!(:order) {create(:order)}
  let(:variant) {create(:variant)}
  let(:line_item) {create(:line_item)}
  let(:context) {{}}

  describe 'Order' do
    it 'Creates a new order when given an e-mail address' do
      query = <<-GRAPHQL
        mutation{
          createOrder(input:{email:"test@example.com"} ){
            orderToken
            order{
              id
              number
            }
          }
        }
      GRAPHQL
      response = Spree::GraphQL::Schema.execute(query)
      expect(response['data']['createOrder']['orderToken']).not_to be nil
    end

    it 'Really adds an item when adding an item' do
      query = <<-GRAPHQL
        mutation{
          createOrder(input:{email:"test@example.com"} ){
            orderToken
            order{
              id
              number
            }
          }
        }
      GRAPHQL
      response = Spree::GraphQL::Schema.execute(query)
      orderToken = response['data']['createOrder']['orderToken']

      add_item_query = <<-GRAPHQL
        mutation($order_token: String, $variant_id: ID!){
          addOrUpdateItem(input:{orderToken:$order_token,variantId:$variant_id,quantity:2}){
            lineItem{
              id
              quantity
              variant{
                id
                sku
              }
            }
          }
        }
      GRAPHQL
      variables = {
        'order_token' => orderToken,
        'variant_id' => variant.id
      }
      response = Spree::GraphQL::Schema.execute(add_item_query, variables: variables)
      #puts "Info #{response.to_json}"
      result=response['data']['addOrUpdateItem']['lineItem']['quantity']
      expect(result.to_i).to be 2
    end
  end
end
