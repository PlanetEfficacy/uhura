Rails.application.routes.draw do
  root  'groups#index'
  get   '/auth/google',             as: 'login'
  get   'auth/:provider/callback',  to: 'sessions#create'
  get   'logout',                   to: 'sessions#destroy'

  get   '/groups/:id/messages/new', to: 'group_messages#new',    as: 'new_group_message'
  post  '/groups/:id/messages',     to: 'group_messages#create', as: 'group_message'

  # resources :group do
  #   resources :messages, only: [:new, :create]
  # end

  resources :groups
  resources :students
  resources :messages,              only: [:new, :create]
  resources :guardians

end
