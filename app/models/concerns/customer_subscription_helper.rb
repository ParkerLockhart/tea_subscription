module CustomerSubscriptionHelper
  extend ActiveSupport::Concern

  class_methods do
    def subscription_finder(customer_subscription)
      Subscription.find(customer_subscription.subscription_id)
    end
  end
end 
