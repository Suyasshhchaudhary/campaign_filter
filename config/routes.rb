Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:index, :new, :create] do
      collection do
        get 'filter'
      end
    end
  end
  root 'users#index'
end
