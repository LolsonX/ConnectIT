# frozen_string_literal: true

Rails.application.routes.draw do

  namespace :ver1 do
    resources :posts
  end
  namespace :ver1 do
    resources :tags
  end
  devise_for :users, defaults: {format: :json}, controllers: {
    registrations: "users/registrations"
  }
  mount Rswag::Ui::Engine => "/"
  mount Rswag::Api::Engine => "/"
end
