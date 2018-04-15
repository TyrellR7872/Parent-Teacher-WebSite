Rails.application.routes.draw do
  resources :calendar_events
  root "home#index"
  resources :user_accounts
  root "user_accounts#new"
  # render static pages
   controller :pages do
     # get :home
     get :about
     get :clubs
   end
  # get 'user_accounts/new'
  #
  # get 'user_accounts/create'
  #
  # get 'user_accounts/update'
  #
  # get 'user_account/new'
  #
  # get 'user_account/create'
  #
  # get 'user_account/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
