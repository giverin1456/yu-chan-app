Rails.application.routes.draw do
  devise_for :admins
  root to: 'items#index'

  resources :users do
    resources :outpatients
    resources :somatics

    collection do
      get 'search'
    end
  end
end
