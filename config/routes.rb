Typist::Application.routes.draw do
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  root 'static_pages#home'
end
