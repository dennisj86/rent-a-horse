Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :horses, only: %i[index show new create] do
    resources :bookings, only: %i[show new create destroy]
  end
end
