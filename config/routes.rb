Rails.application.routes.draw do

  resource :player, only: :show do
    get :inventory
  end

  namespace :player do
    resources :stats, only: :index do
      post :increase
    end
  end

  namespace :item do
    resources :categories, only: [:index, :show]
    resources :items, except: :all do
      post :buy
      post :put_on
      post :put_off
    end
  end

  root 'locations#main'

  devise_for :users

  resources :locations, only: :show do
    collection do
      get :main
      get :shop
    end
  end
end
