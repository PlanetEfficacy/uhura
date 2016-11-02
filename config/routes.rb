Rails.application.routes.draw do
  root  'groups#index'
  get   '/auth/google',             as: 'login'
  get   'auth/:provider/callback',  to: 'sessions#create'
  get   'logout',                   to: 'sessions#destroy'

  resources :groups, only: [:index, :new, :create]
end
