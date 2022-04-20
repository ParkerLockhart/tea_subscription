class Api::V1::CustomerSubscriptionsController < ApplicationController
  include ExceptionHandler
  
  def index
    customer = Customer.find(params[:id])
    render json: CustomerSubscriptionSerializer.new(customer.customer_subscriptions)
  end
end
