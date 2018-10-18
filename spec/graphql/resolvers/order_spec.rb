describe 'Resolvers' do
  describe 'Order' do
    let!(:order) {create(:completed_order_with_pending_payment)}
    let!(:context){{}}

    it 'Returns order from payment' do
      payment=order.payments.first
      response=::Spree::GraphQL::Resolvers::Order::FromPayment.call(payment,{},context).id
      expect(response).to eq(order.id)
    end
  end
end
