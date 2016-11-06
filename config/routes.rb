Rails.application.routes.draw do
  root  'groups#index'
  get   '/auth/google',             as: 'login'
  get   'auth/:provider/callback',  to: 'sessions#create'
  get   'logout',                   to: 'sessions#destroy'

  resources :groups
  resources :students
  resources :messages, only: [:new, :create]
  resources :guardians
end
