# frozen_string_literal: true

Rails.application.routes.draw do

  resources :favorites

  resources :courses
  resources :images
  # root 'students#index'
  root to: 'dashboards#show'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  get '/students/help' => 'students#help', as: :help
  get '/students/upload' => 'students#upload', as: :upload
  resources :students

  resources :students do
    get 'help', on: :collection
    get 'upload', on: :collection
  end

  resources :students do 
    collection { post :import }
  end

  resource :students do 
    member do
      post :favor
    end
  end

  resource :courses do 
    member do
      post :delc
    end
  end

  resources :images do 
    collection { post :import }
  end

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end