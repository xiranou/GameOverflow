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
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

end
