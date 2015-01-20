Rails.application.routes.draw do
  root 'front_page#index'

  resources :projects, except: :show
  resources :contacts, only: [:new, :create]

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'
end
