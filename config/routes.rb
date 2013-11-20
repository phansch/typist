Typist::Application.routes.draw do
  match '/signup',  to: 'users#new',            via: 'get'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/learn', to: 'static_pages#learn', via: 'get'
  root 'static_pages#home'
end
