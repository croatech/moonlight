Rails.application.routes.draw do

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

  namespace :equipment do
    resources :categories, only: [:index, :show]
    resources :items, except: :all do
      post :buy
      post :put_on
      post :put_off
    end
  end

  resources :locations, except: :all do
    collection do
      get :moon_light
      get :the_elder_shop
      get :wayward_pines
    end

    resources :cells, only: :show
  end
end
