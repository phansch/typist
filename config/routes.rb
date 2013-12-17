Typist::Application.routes.draw do
  devise_for :user
  # General resources
  resource :user

  # Lesson routes
  match 'lessons/:id',  to: 'lesson#show',      via: 'get'

  # Practice routes
  match 'practices/:id', to: 'practice#show',    via: 'get'
  match 'practices',     to: 'practice#create',  via: 'post'

  # Static pages
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/learn',   to: 'static_pages#learn',   via: 'get'
  devise_scope :user do
    match '/signup',  to: 'devise/registrations#new',   via: 'get'
    match '/signin',  to: 'devise/sessions#new',        via: 'get'
    match '/signout', to: 'devise/sessions#destroy',    via: 'delete'
  end

  root 'static_pages#home'
end
