# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

customer = Customer.create(first_name: "Maile", last_name: "Anderson", email: "maile@gleason.org", address: "3728 Dare Harbor, Swiftfurt, TN 35805")
customer2 = Customer.create(first_name: "Hiram", last_name: "Smith", email: "hiram@braun-wuckert.name", address: "89709 Bridge, Freidaside, AZ 79440")

tea = Tea.create(name: "Sencha Green", description: "Grassy despair", temperature: "148 degrees", brew_time: "10 minutes")
tea2 = Tea.create(name: "Bancha Green", description: "Amazement butter pecan", temperature: "193 degrees", brew_time: "6 minutes" )
tea3 = Tea.create(name: "Longjing Green", description: "Rage banana", temperature: "164 degrees", brew_time: "5 minutes")

subscription = Subscription.create(title: "Green Sampler", price: 3425, frequency: "monthly")
subscription2 = Subscription.create(title: "Lyra Constellation Sampler", price: 6481, freqency: "monthly")

subscription_tea = SubscriptionTea.create(subscription: subscription, tea: tea)
subscription_tea2 = SubscriptionTea.create(subscription: subscription, tea: tea2)
subscription_tea3 = SubscriptionTea.create(subscription: subscription, tea: tea3)

customer_subscription = CustomerSubscription.create(customer: customer, subscription: subscription)
