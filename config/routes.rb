Rails.application.routes.draw do

  devise_for :user_account, :controllers => {
    :registrations => 'user_accounts/registrations', :sessions => 'user_accounts/sessions'}
  resources :calendar_events do
    member do
      get 'volunteer_signup'
      get 'show_volunteer_list'
    end
  end
  root "home#index"

  resources :user_accounts do
    collection do
      get "email"
      get "view"
    end
  end

  # render static pages
  controller :pages do
    get ':id', to: 'pages#show', as: 'pages'
  end


  resources :requests




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
