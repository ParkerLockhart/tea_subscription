require 'rails_helper'

describe 'Customer Subscriptions Endpoint' do
  describe 'GET customer subscriptions' do
    before(:each) do
      customer = create(:customer)
      create_list(:customer_subscription, 3, customer: customer)
      get "/api/v1/customers/#{customer.id}/subscriptions"
    end

    let!(:subscriptions) { JSON.parse(response.body, symbolize_names: true) }

    it 'returns successful' do
      expect(response).to be_successful
    end

    it 'returns correct number of objects' do
      expect(subscriptions[:data].count).to eq(3)
    end

    it 'returns correct info for each object' do
      subscriptions[:data].each do |subscription|
        expect(subscription).to have_key(:id)
        expect(subscription[:id]).to be_a(String)

        expect(subscription).to have_key(:type)
        expect(subscription[:type]).to eq("customer_subscription")

        expect(subscription).to have_key(:attributes)
        expect(subscription[:attributes]).to be_a(Hash)

        attributes = subscription[:attributes]

        expect(attributes).to have_key(:status)
        expect(attributes[:status]).to be_a(String)

        expect(attributes).to have_key(:title)
        expect(attributes[:title]).to be_a(String)

        expect(attributes).to have_key(:price)
        expect(attributes[:price]).to be_an(Integer)

        expect(attributes).to have_key(:frequency)
        expect(attributes[:frequency]).to be_a(String)
      end
    end

    it 'returns status 404 if merchant ID invalid' do
      get "/api/v1/customers/58178116817/subscriptions"

      expect(response.status).to eq(404)
    end 
  end
end
