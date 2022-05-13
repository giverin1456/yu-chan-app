Rails.application.routes.draw do
  root to: 'items#index'

  resources :users, only: [:index, :new, :create, :show, :edit, :update,] 
end
