describe 'Resolvers' do
  describe 'Order' do
    let!(:order) {create(:completed_order_with_pending_payment)}
    let!(:context){{}}
    it 'should return an order from a payment' do
      payment=order.payments.first
      expect(::Spree::GraphQL::OrderResolver::FromPayment.call(payment,{},context).id).to equal(order.id)
    end
  end
end
