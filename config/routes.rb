# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, defaults: {format: :json}
  namespace :api do
    namespace :ver_1 do
    end
  end
  mount Rswag::Ui::Engine => "/"
  mount Rswag::Api::Engine => "/"
end
