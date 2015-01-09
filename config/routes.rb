Rails.application.routes.draw do
  root 'front_page#index'

  resources :projects, except: :show
end
