Rails.application.routes.draw do

  root 'locations#moon_light'

  devise_for :users

  resources :fights, only: [:create, :show] do
    get :log
    
    resources :rounds do
      post :hit
    end
  end

  #resource :player, only: :show

  resources :resources do
    post :collect
  end

  namespace :player do
    resources :stats, only: :index do
      post :increase
    end

    resources :inventory, only: :index do
      collection do 
        get :equipment
        get :tools
        get :resources
      end
    end
  end

  namespace :equipment do
    resources :categories, only: [:index, :show]
    resources :items, except: :all do
      post :buy
      post :put_on
      post :put_off
      post :sell
    end
  end

  namespace :tool do
    resources :categories, only: [:index, :show]
    resources :items, except: :all do
      post :buy
      post :put_on
      post :put_off
      post :sell
    end
  end

  resources :locations, except: :all do
    collection do
      get :moon_light
      get :weapon_shop
      get :craft_shop
      get :wayward_pines
    end

    resources :cells, only: :show
  end
end
