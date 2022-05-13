Rails.application.routes.draw do
  devise_for :admins
  root to: 'items#index'
  resources :users, only: [:index, :new, :create, :show, :edit, :update,] 
end
