Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'locations#moon_light'

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  namespace :api do
    resources :players, only: [:index, :show] do
      get :current, on: :collection
    end

    namespace :player do
      resources :stats, only: :index do
        patch :increase
      end
    end

    namespace :equipment do
      resources :categories, only: :index
      resources :items, only: :show do
        patch :buy
      end
    end

    namespace :artifacts do
      resources :categories, only: :index
    end

    namespace :tools do
      resources :categories, only: :index
      resources :items, only: :show do
        patch :buy
      end
    end
  end

  resources :fights, only: [:create, :show] do
    resources :rounds do
      post :hit
    end
  end

  resources :players, only: :show

  resources :resources do
    put :collect
    put :sell_all, on: :collection
  end

  namespace :player do
    resources :stats, only: :index

    namespace :inventory, path: 'inventory' do
      get :index
      get :equipment
      get :tools
      get :resources
    end

    namespace :settings, path: 'settings' do
      get :index
      get :avatar
      put :change_avatar
    end
  end

  namespace :equipment do
    resources :items, only: :show do
      put :put_on
      put :take_off
      put :sell
    end
  end

  namespace :tool do
    resources :items, except: :all do
      put :put_on
      put :take_off
      put :sell
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

    resources :cells, only: :show do
      get :move
    end
  end
end
