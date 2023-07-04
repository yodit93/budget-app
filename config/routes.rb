Rails.application.routes.draw do
  root 'mobile_banking#welcome'
  devise_for :users
  get 'categories', to: 'categories#index'
end
