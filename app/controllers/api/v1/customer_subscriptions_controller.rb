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

  def update

    if customer_subscription = CustomerSubscription.where(customer_id: params[:id]).where(subscription_id: params[:subscription_id]).first
      if params[:status] == "cancelled" || params[:status] == "paused" || params[:status] == "active"
        customer_subscription.update(status: params[:status])
        render json: CustomerSubscriptionSerializer.new(customer_subscription)
      else
        render json: { errors: "Unable to update customer subscription status. Status can only be 'active', 'paused', or 'cancelled'." }, status: :unprocessable_entity
      end   
    else
      raise ActiveRecord::RecordNotFound
    end
  end

end
