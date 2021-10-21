Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # As a visitor I can see all the horses (near my location)
  get "horses" to: "horses#index"
  # As a visitor I can access the detail page of a horse
  get "horses/:id" to: "horses#show"

  # As a user I can create a horse (put on the market to rent)
#  get "horses/new", to: "horses#new"
#  post "horses", to: "horses#create"

  # As a user I can update a horses attributes
#  get "horses/:id/edit", to: "horses#edit"
#  patch "horses/:id", to: "horses#update"

  # As a user I can delete/remove a horse from market
#  delete "horses/:id", to: "horses#destroy"

  # As a user I can book interesting horses
  get "horses/:id/bookings/new" to: "bookings#new"
  post "horses/:id/bookings" to: "bookings#create"

  # As a user I can see my bookings/booking history
#  get "bookings/:id" to: "bookings#show"

  # As a user I can change a booking
#  patch "bookings/:id" to: "bookings#update"

  # As a user I can cancel my booking (also has to put horse back on market)
#  delete "bookings/:id" to: "bookings#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
