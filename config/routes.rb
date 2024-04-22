# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do

  resources :posts
  resources :posts do
    resources :comments, only: [:create, :new]
  end

  root to: "home#index"

  devise_for :users

  resources :upload_file, only: [:new, :create]


  Rails.application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
