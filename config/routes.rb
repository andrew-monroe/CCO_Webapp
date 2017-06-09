Rails.application.routes.draw do
  devise_for :admins
  devise_for :coordinators
  # devise_for :installs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :volunteer_needs, only: [:index, :show]
  resources :coordinators
  resources :agencies, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :needs, only: [:index, :show]

  get '/coordinator_view/needs', to: 'coordinator_view#index'
  get '/coordinator_view/need/:id', to: 'coordinator_view#show'

  get '/galaxy/fetch_needs', to: 'galaxy#fetch_needs'
  get '/galaxy/fetch_agencies', to: 'galaxy#fetch_agencies'
  get '/galaxy/fetch_users', to: 'galaxy#fetch_users'

  root 'volunteer_needs#index'
end
