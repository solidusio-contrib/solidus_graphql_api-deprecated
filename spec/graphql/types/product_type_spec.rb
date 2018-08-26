require "spec_helper"

describe "graphql product" do
  let!(:products) {create_list(:product, 2)}
  let!(:inactive_product) {create(:product, available_on: Time.current.tomorrow, name: "inactive")}

  it "returns available products" do
    available_products = <<-GRAPHQL
    {
      products {
        name
      }
    }
    GRAPHQL

    response = SolidusGraphQLApiSchema.execute(available_products)
    products = response.dig("data", "products")
    expect(products.count).to eq(2)
    expect(products.map {|node| node[:name]}).to_not include(inactive_product.name)
  end

  describe "product with variants" do
    let!(:variant_product) {create(:variant)}
    it "returns variant data when a product with variants is fetched" do


    variants= <<-GRAPHQL
    {
    products{
      id
      name
       variants {
        edges {
        node {
          id
        }
        }
       }
     }
    }
      GRAPHQL

      response = SolidusGraphQLApiSchema.execute(variants)

    end
  end
end