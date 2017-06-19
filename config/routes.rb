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
    resources :coordinators do
      put :password_reset, on: :member
    end
    # put 'coordinators/:id/password_reset', to: 'coordinators#password_reset', as: 'password_reset_coordinator'
    resources :agencies, only: [:index, :show]
    resources :users, only: [:index, :show]
    resources :needs, only: [:index, :show]

    put '/galaxy/fetch_needs', to: 'galaxy#fetch_needs'
    put '/galaxy/fetch_agencies', to: 'galaxy#fetch_agencies'
    put '/galaxy/fetch_users', to: 'galaxy#fetch_users'

    delete '/database/destroy_all_needs', to: 'database#destroy_all_needs'
    delete '/database/destroy_all_agencies', to: 'database#destroy_all_agencies'
    delete '/database/destroy_all_users', to: 'database#destroy_all_users'
    delete '/database/destroy_all_coordinators', to: 'database#destroy_all_coordinators'
  end

  root 'needs#index'
end
