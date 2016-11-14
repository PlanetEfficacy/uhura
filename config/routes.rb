Rails.application.routes.draw do
  root  'home#index',               as: 'root'
  get   '/auth/google',             as: 'login'
  get   'auth/:provider/callback',  to: 'sessions#create'
  get   'logout',                   to: 'sessions#destroy'

  get   '/groups/:id/messages/new', to: 'group_messages#new',    as: 'new_group_message'
  post  '/groups/:id/messages',     to: 'group_messages#create', as: 'group_message'
  get   '/groups/:id/upload/new',   to: 'group_upload#new',      as: 'new_upload'
  post  '/groups/:id/upload',       to: 'group_upload#create',   as: 'upload'
  get   '/groups/:id/add',          to: 'add_student#new',       as: 'new_add_student'
  post  '/groups/:id/add',          to: 'add_student#create',    as: 'add_student'

  get   '/groups/:id/guardians/messages/new', to: 'group_guardians_messages#new',     as: 'new_group_guardian_message'
  post  '/groups/:id/guardians/messages',     to: 'group_guardians_messages#create',  as: 'group_guardian_message'


  resources :groups
  resources :students
  resources :messages,              only: [:new, :create]
  resources :guardians

end
