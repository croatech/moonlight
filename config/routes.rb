Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'locations#wayward_pines'

  # API
  namespace :api do
    namespace :player do
      resources :stats, only: :index do
        patch :increase
      end
    end

    namespace :stuff do
      resources :categories, only: :index
      resources :items, only: :show do
        post :buy
        post :put_on
        post :take_off
        post :sell
      end
    end

    resources :messages, only: [:index, :create]
    resource :fight, only: [:show, :update]

    resources :users, only: :create do
      post :auth, on: :collection
    end

    resources :players, only: [:index, :show] do
      collection do
        get :current
        get :online
      end
    end

    resources :locations, except: :all do
      collection do
        get :wayward_pines
      end
    end

    resources :cells, except: :all do
      post :move
    end
  end

  # Backend
  resource :fight, only: [:create, :show]
  resources :players, only: :show
  resources :cells, only: :show

  resources :resources do
    put :collect
  end

  namespace :player do
    resources :stats, only: :index

    namespace :inventory, path: 'inventory' do
      get :index
    end

    namespace :settings, path: 'settings' do
      get :index
      get :avatar
      put :change_avatar
    end
  end

  resources :locations, except: :all do
    collection do
      get :moon_light
      get :weapon_shop
      get :craft_shop
      get :shop_of_artifacts
      get :wayward_pines
    end
  end
end
