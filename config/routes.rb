Rails.application.routes.draw do
  devise_for :admins
  devise_for :coordinators, :skip => [:registrations]
  as :coordinator do
    get 'coordinators/edit' => 'devise/registrations#edit', :as => 'edit_coordinator_registration'
    put 'coordinators' => 'devise/registrations#update', :as => 'coordinator_registration'
  end
  # devise_for :installs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :needs, only: [:index, :show]

  get '/admin', to: 'admin/agencies#index'

  namespace :admin do
    resources :coordinators
    resources :agencies, only: [:index, :show]
    resources :users, only: [:index, :show]
    resources :needs, only: [:index, :show]
  end

  get '/galaxy/fetch_needs', to: 'galaxy#fetch_needs'
  get '/galaxy/fetch_agencies', to: 'galaxy#fetch_agencies'
  get '/galaxy/fetch_users', to: 'galaxy#fetch_users'

  root 'needs#index'
end
