Typist::Application.routes.draw do
  match '/help', to: 'static_pages#help', via: 'get'
  root 'static_pages#home'
end
