module CustomerSubscriptionHelper
  extend ActiveSupport::Concern

  class_methods do
    def subscription_finder(customer_subscription)
      customer_subscription.subscription
    end
  end
end
