Rails.application.routes.draw do

  #resources :bots, except: :all

  root 'locations#moon_light'

  devise_for :users

  resources :fights, only: [:create, :show] do
    get :log
    
    resources :rounds do
      post :hit
    end
  end

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

  resources :locations, only: :show do
    collection do
      get :moon_light
      get :the_elder_shop
      get :mushrooms
    end
  end
end
