Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :horses, only: %i[index show new create] do
    resources :bookings, only: %i[show new create destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
