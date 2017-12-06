Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"

  get '/auth/github', as: :github_login

  get '/auth/github/callback', to: "sessions#create"

  get '/users/:user_name', to: "users#show", as: :user
end
