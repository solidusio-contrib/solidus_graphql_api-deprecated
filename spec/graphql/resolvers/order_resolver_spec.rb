
describe 'OrderResolver' do


  let!(:order) {create(:completed_order_with_pending_payment)}
  let!(:context){{}}
  it 'should Return an from a payment' do
    payment=order.payments.first
    expect(::Solidus::GraphQL::OrderResolver::FromPayment.call(payment,{},context).id).to equal(order.id)

  end
end