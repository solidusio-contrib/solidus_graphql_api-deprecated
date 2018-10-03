RSpec.describe "Order mutation" do

  let!(:order) {create(:order)}
  let(:variant) {create(:variant)}
  let(:line_item) {create(:line_item)}
  let(:context) {{}}


  describe "OrderMutation" do


    it 'should create a new order when given an e-mail address' do
      query_str = <<-GRAPHQL
      mutation{
      createOrder(input:{email:"test@example.come"} ){
       orderToken
       order{
         id
         number
        }
       }
      }
      GRAPHQL
      response = SolidusSchema.execute(query_str)
      expect(response["data"]["createOrder"]["orderToken"]).not_to be nil
    end


    it 'should add an item when addign an item' do
      query_str = <<-GRAPHQL
      mutation{
      createOrder(input:{email:"test@example.come"} ){
       orderToken
       order{
         id
         number
        }
       }
      }
      GRAPHQL
      response = SolidusSchema.execute(query_str)
      orderToken = response["data"]["createOrder"]["orderToken"]
      add_item_query_str = <<-GRAPHQL
      mutation{
      addOrUpdateItem(input:{orderToken:"#{orderToken}",variantId:"#{variant.id}",quantity:2}){
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
      response = SolidusSchema.execute(add_item_query_str)
      puts "Info #{response.to_json}"
      quantity=response["data"]["addOrUpdateItem"]["lineItem"]["quantity"]
      expect(quantity.to_i).to be 2


    end
  end
end
