Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
  end

  namespace :admin do
    get 'users/create'
  end

  namespace :admin do
    get 'users/new'
  end

  namespace :admin do
    get 'users/edit'
  end

  namespace :admin do
    get 'users/destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :needs

  root 'needs#index'
end
