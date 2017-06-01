Rails.application.routes.draw do
  devise_for :admins
  devise_for :coordinators
  # devise_for :installs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :needs

  resources :admins

  root 'needs#index'
end
