Typist::Application.routes.draw do
  # General resources
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  # Lesson routes
  match 'lessons/:id',  to: 'lesson#show',      via: 'get'

  # Practice routes
  match 'practice/:id', to: 'practice#show',    via: 'get'
  match 'practice',     to: 'practice#create',  via: 'post'

  # Static pages
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/learn',   to: 'static_pages#learn',   via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  root 'static_pages#home'
end
