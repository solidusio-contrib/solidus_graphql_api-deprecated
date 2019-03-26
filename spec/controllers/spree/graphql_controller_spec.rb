# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Spree::GraphqlController do
  describe '#execute' do
    let(:action) { post :execute, {} }
    let(:headers) { {} }

    subject { action }

    before { @request.headers.merge! headers }

    context 'when the authentication is required' do
      before { Spree::GraphQL::Config.set(requires_authentication: false) }

      context 'when the API key is invalid' do
        let(:headers) { { 'Authorization' => 'Bearer INVALID_API_KEY' } }

        it { is_expected.to have_http_status :unauthorized }

        it 'does not execute any GraphQL query' do
          expect(Spree::GraphQL::Schema::Schema).not_to receive(:execute)
          subject
        end
      end

      context 'when the API key is missing' do
        it { is_expected.to have_http_status :ok }

        it 'does not set any user as the current user in the GraphQL context' do
          expect(Spree::GraphQL::Schema::Schema).to receive(:execute).with(
            anything,
            a_hash_including(
              context: a_hash_including(
                current_user: nil
              )
            )
          )
          subject
        end
      end

      context 'when the API key is valid' do
        let(:user) { create :user }
        let(:headers) { { 'Authorization' => "Bearer #{user.generate_jwt_token}" } }

        it { is_expected.to have_http_status :ok }

        it 'sets the user matching the API key as the current user in the GraphQL context' do
          expect(Spree::GraphQL::Schema::Schema).to receive(:execute).with(
            anything,
            a_hash_including(
              context: a_hash_including(
                current_user: user
              )
            )
          )
          subject
        end
      end
    end

    context 'when the authentication is not required' do
      before { Spree::GraphQL::Config.set(requires_authentication: true) }

      context 'when the API key is invalid' do
        let(:headers) { { 'Authorization' => 'Bearer INVALID_API_KEY' } }

        it { is_expected.to have_http_status :unauthorized }

        it 'does not execute any GraphQL query' do
          expect(Spree::GraphQL::Schema::Schema).not_to receive(:execute)
          subject
        end
      end

      context 'when the API key is missing' do
        it { is_expected.to have_http_status :unauthorized }

        it 'does not execute any GraphQL query' do
          expect(Spree::GraphQL::Schema::Schema).not_to receive(:execute)
          subject
        end
      end

      context 'when the API key is valid' do
        let(:user) { create :user }
        let(:headers) { { 'Authorization' => "Bearer #{user.generate_jwt_token}" } }

        it { is_expected.to have_http_status :ok }

        it 'sets the user matching the API key as the current user in the GraphQL context' do
          expect(Spree::GraphQL::Schema::Schema).to receive(:execute).with(
            anything,
            a_hash_including(
              context: a_hash_including(
                current_user: user
              )
            )
          )
          subject
        end
      end
    end
  end
end
