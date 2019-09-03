# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :investors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get 'about_us',             to: 'home#about_us'
  get 'faq',                  to: 'home#faq'
  get 'opportunities',        to: 'home#opportunities'
  get 'about_us',             to: 'home#about_us'
  get 'contacts',             to: 'home#contacts'
  get 'terms_and_conditions', to: 'home#terms_and_conditions'
  get 'investments',          to: 'investments#index'

  resources :entrepreneurs do
    resources :investments, only: %i[new create]
  end
end
