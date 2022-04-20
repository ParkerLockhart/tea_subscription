Rails.application.routes.draw do
 namespace :api do
   namespace :v1 do
     get '/customers/:id/subscriptions', to: 'customer_subscriptions#index'
   end
 end
end
