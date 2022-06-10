Rails.application.routes.draw do
  devise_for :admins
  root to: 'items#index'
  resources :items do
    collection do
      get 'information'
      get 'reservation'
    end
  end
  resources :admins
  resources :users do
    resources :outpatients
    resources :somatics

    collection do
      get 'search'
    end
  end
end
