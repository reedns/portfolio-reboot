Rails.application.routes.draw do
  root 'portfolio#index'

  namespace :api do
    resources :projects
  end
end
