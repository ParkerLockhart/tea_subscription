class Api::V1::CustomerSubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:id])
    render json: CustomerSubscriptionSerializer.new(customer.customer_subscriptions)
  end

  def create
    customer = Customer.find(params[:id])
    subscription = Subscription.find(params[:subscription_id])
    subscribe = CustomerSubscription.create(customer: customer, subscription: subscription)

    if subscription.save
      render json: CustomerSubscriptionSerializer.new(subscribe)
    else
      render json: { errors: "Unable to subscribe customer."  }, status: :unprocessable_entity
    end
  end

end
