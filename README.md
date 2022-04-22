# Tea Subscription

Back End REST API for a tea subscription service.

![Screen Shot 2022-04-21 at 11 44 13 PM](https://user-images.githubusercontent.com/88950699/164604853-966eb0a1-db6f-49e4-9b4b-fdaa02fc6bc1.png)

Skip to section: 
<details>
  <summary> Installation </summary>
  
  - [Clone repo](#clone-the-repository)
  - [Ruby version](#check-your-ruby-version)
  - [Dependencies](#install-dependencies)
  - [How to run the test suite](#to-run-the-test-suite)
  - [Start local server](#start-local-server)
</details>

<details>
  <summary> Endpoints </summary>
  
  - [Show all customer subscriptions](#get-subscriptions)
  - [Subscribe customer to new subscription](#subscribe)
  - [Cancel or pause customer subscription](#update-subscription)
  
</details>




## Installation

### Clone the repository 
``` 
git clone git@github.com:ParkerLockhart/tea_subscription.git
cd tea_subscription
```

### Check your ruby version
```
ruby -v
```
This repo uses `ruby 2.7.2`  so if needed, install the correct version using [rbenv](https://github.com/rbenv/rbenv):

```
rbenv install 2.7.2
```

### Install dependencies
 
 Using [bundler](https://bundler.io/):
 ```
bundle install
```

### Initialize the database 
```
rails db:create db:migrate db:seed
```

### To run the test suite:

```
rspec 
```

### Start local server 
```
rails s
```

## Endpoints 

### Get Subscriptions

GET http://localhost:3000/api/v1/customers/:id/subscriptions

Contains all customer subscriptions, active, paused, and cancelled.

Example response:

<details>
  <summary> 200 OK </summary>

```
{
    "data": [
        {
            "id": "1",
            "type": "customer_subscription",
            "attributes": {
                "status": "active",
                "title": "Green Sampler",
                "price": 3425,
                "frequency": "monthly"
            }
        }
    ]
}
```
</details>


<details>
  <summary> 404 NOT FOUND </summary>

```
{
    "errors": "Couldn't find Customer with 'id'=68"
}
```
</details>

### Subscribe

POST http://localhost:3000/api/v1/customer/:id/subscriptions

Subscribes a customer to a subscription, returns subscription info with status shown as "active".  

Parameters: 
 | param | data type | value | required/optional |
 |---|---|---|---|
 | subscription_id | integer | valid subscription id | REQUIRED |

Example response: 

<details>
  <summary> 200 OK </summary>

```
{
    "data": {
        "id": "1",
        "type": "customer_subscription",
        "attributes": {
            "status": "active",
            "title": "Green Sampler",
            "price": 3425,
            "frequency": "monthly"
        }
    }
}
```
</details>

<details>
  <summary> 404 NOT FOUND </summary>

```
{
    "errors": "Couldn't find Subscription with 'id'=81"
}
```
</details>

### Update Subscription

PATCH http://localhost:3000/api/v1/customers/:id/subscriptions/:subscription_id

Updates customer subscription status. Returns subscription information with updated status shown.

Parameters:
 | param | data type | value | required/optional |
 |---|---|---|---|
 | status | string | only accepts "active", "paused", or "cancelled" | REQUIRED |

Example response: 

<details>
  <summary> 200 OK </summary>

  ```
{
    "data": {
        "id": "1",
        "type": "customer_subscription",
        "attributes": {
            "status": "cancelled",
            "title": "Green Sampler",
            "price": 3425,
            "frequency": "monthly"
        }
    }
}
```
</details>

<details>
  <summary> 422 Unprocessable Entity </summary>
  
{
    "errors": "Unable to update customer subscription status. Status can only be 'active', 'paused', or 'cancelled'."
}
</details>
