Rails.application.routes.draw do

  get 'user_accounts/new'

  get 'user_accounts/create'

  get 'user_accounts/update'

  get 'user_account/new'

  get 'user_account/create'

  get 'user_account/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user_accounts
  root "user_accounts#new"
end
