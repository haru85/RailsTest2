Rails.application.routes.draw do
  get 'reservations/show'
  devise_for :users, skip: [:confirmations, :mailer, :passwords, :unlocks], controllers: {
    registrations: 'users/registrations',
  }
  root to:'home#index'
  resources :rooms, only:[:index, :new, :create, :show]
  resources :reservations, only:[:index, :create]
end
