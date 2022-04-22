Rails.application.routes.draw do
 namespace :api do
   namespace :v1 do
     get '/customers/:id/subscriptions', to: 'customer_subscriptions#index'
     post '/customers/:id/subscriptions', to: 'customer_subscriptions#create'
     patch '/customers/:id/subscriptions/:subscription_id', to: 'customer_subscriptions#update'
   end
 end
end
