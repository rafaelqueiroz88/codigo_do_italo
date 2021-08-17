Rails.application.routes.draw do

  # This is where react is going to work
  root 'pages#index'

  namespace :api do
    namespace :v1 do

      resources :authors, param: :slug
    end
  end

  get '*path', to: 'pages#index', via: :all
end
