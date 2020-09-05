Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: [:index, :new, :create, :show, :update] do
    resources :doses, only: :create  
  end
  resources :doses, only: [:destroy]
  
end
