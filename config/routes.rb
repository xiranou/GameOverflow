Rails.application.routes.draw do
  root "welcome#index"
  resources :articles

  resources :comments do
    get "new_reply"
    post "reply"
    post "vote"
  end

  resources :users

  get 'logout' => 'sessions#destroy'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

end
