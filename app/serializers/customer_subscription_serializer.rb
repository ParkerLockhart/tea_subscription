class CustomerSubscriptionSerializer
  include JSONAPI::Serializer
  include CustomerSubscriptionHelper
  attributes :status

  attribute :title do |customer_subscription|
    subscription_finder(customer_subscription).title
  end

  attribute :price do |customer_subscription|
    subscription_finder(customer_subscription).price
  end

  attribute :frequency do |customer_subscription|
    subscription_finder(customer_subscription).frequency
  end
end
