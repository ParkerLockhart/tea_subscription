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

    it 'returns status 404 if customer ID invalid' do
      get "/api/v1/customers/58178116817/subscriptions"

      expect(response.status).to eq(404)
    end
  end

  describe 'POST customer subscription' do
    before(:each) do
      customer = create(:customer)
      subscription = create(:subscription)

      post "/api/v1/customers/#{customer.id}/subscriptions", params: { subscription_id: subscription.id }
    end

    let!(:customer_subscription) { JSON.parse(response.body, symbolize_names: true) }

    it 'returns successful' do
      expect(response).to be_successful
    end

    it 'returns correct info' do
      expect(customer_subscription[:data]).to have_key(:id)
      expect(customer_subscription[:data][:id]).to be_a(String)

      expect(customer_subscription[:data]).to have_key(:type)
      expect(customer_subscription[:data][:type]).to eq("customer_subscription")

      expect(customer_subscription[:data]).to have_key(:attributes)
      expect(customer_subscription[:data][:attributes]).to be_a(Hash)

      attributes = customer_subscription[:data][:attributes]

      expect(attributes).to have_key(:status)
      expect(attributes[:status]).to be_a(String)

      expect(attributes).to have_key(:title)
      expect(attributes[:title]).to be_a(String)

      expect(attributes).to have_key(:price)
      expect(attributes[:price]).to be_an(Integer)

      expect(attributes).to have_key(:frequency)
      expect(attributes[:frequency]).to be_a(String)
    end

    it 'returns code 404 if customer or subscription not found' do
      post "/api/v1/customers/234234/subscriptions"

      expect(response.status).to eq(404)
    end
  end

  describe 'PATCH customer subscription' do
    before(:each) do
      @customer_subscription = create(:customer_subscription)

      patch "/api/v1/customers/#{@customer_subscription.customer_id}/subscriptions/#{@customer_subscription.subscription_id}", params: { status: "cancelled" }
    end

    let!(:customer_subscription) { JSON.parse(response.body, symbolize_names: true) }

    it 'returns successful' do
      expect(response).to be_successful
    end

    it 'returns correct info' do
      expect(customer_subscription[:data]).to have_key(:id)
      expect(customer_subscription[:data][:id]).to be_a(String)

      expect(customer_subscription[:data]).to have_key(:type)
      expect(customer_subscription[:data][:type]).to eq("customer_subscription")

      expect(customer_subscription[:data]).to have_key(:attributes)
      expect(customer_subscription[:data][:attributes]).to be_a(Hash)

      attributes = customer_subscription[:data][:attributes]

      expect(attributes).to have_key(:status)
      expect(attributes[:status]).to be_a(String)
      expect(attributes[:status]).to eq("cancelled")

      expect(attributes).to have_key(:title)
      expect(attributes[:title]).to be_a(String)

      expect(attributes).to have_key(:price)
      expect(attributes[:price]).to be_an(Integer)

      expect(attributes).to have_key(:frequency)
      expect(attributes[:frequency]).to be_a(String)
    end

    it 'returns code 404 if customer or subscription not found' do
      patch '/api/v1/customers/234234/subscriptions/4'

      expect(response.status).to eq(404)
    end

    it 'returns code 422 if unable to update' do
      patch "/api/v1/customers/#{@customer_subscription.customer_id}/subscriptions/#{@customer_subscription.subscription_id}", params: { status: "jellied" }

      expect(response.status).to eq(422)
    end
  end
end
