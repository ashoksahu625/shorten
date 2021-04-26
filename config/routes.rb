Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  default_url_options :host => "http:localhost:3000"
  get 's/:slug', to: 'shortens#show'
  get 'stats', to: 'shortens#stats'
  resources :shortens,   only:  [:new, :create]
  root :to => "shortens#new"
end