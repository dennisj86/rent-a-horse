Rails.application.routes.draw do
  devise_for :users

  resources :bookings, only: %i[index destroy show]

  root to: 'pages#home'
  resources :horses, only: %i[index show new create] do
    resources :bookings, only: %i[new create]
  end
end
