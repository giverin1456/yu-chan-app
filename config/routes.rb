Rails.application.routes.draw do
  devise_for :admins
  root to: 'items#index'

  resources :users do
  resources :outpatients, only: [:new, :create, :show]
  end
end
