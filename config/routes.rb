Rails.application.routes.draw do
  # root path for non-logged-in users
  unauthenticated do
    root 'mobile_banking#welcome', as: :root_for_non_logged_in
  end

  # Devise routes for user authentication
  devise_for :users

  # Routes for logged-in users
  authenticated :user do
    # Root path for logged-in users
    root 'categories#index', as: :authenticated_root

    # Other category routes for logged-in users
    resources :categories, only: [:index, :new, :create] do
      resources :transfers, only: [:index, :new, :create]
    end
  end
end

