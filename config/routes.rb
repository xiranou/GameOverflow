Rails.application.routes.draw do
  root "welcome#index"
  resources :articles do
    get 'new_comment'
    post 'create_comment'
  end

  resources :comments do
    get "new_reply"
    post "reply"
    post "vote"
  end

end
