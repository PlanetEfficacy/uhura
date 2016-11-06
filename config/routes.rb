Rails.application.routes.draw do
  root  'groups#index'
  get   '/auth/google',             as: 'login'
  get   'auth/:provider/callback',  to: 'sessions#create'
  get   'logout',                   to: 'sessions#destroy'

  resources :groups, only: [:index, :new, :create, :show, :destroy]
  resources :students, only: [:new, :create, :show, :destroy]
  resources :messages, only: [:new, :create]
  resources :guardians, only: [:new, :create, :show]
end
