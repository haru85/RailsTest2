Rails.application.routes.draw do
  devise_for :users, skip: [:confirmations, :mailer, :passwords, :unlocks], controllers: {
    registrations: 'users/registrations',
  }
  root to:'home#index'
  resources :rooms, only:[:index, :new, :create, :show]
  resources :reservations, only:[:index, :create]
  resources :users, only:[:show]
end
