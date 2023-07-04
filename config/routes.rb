Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  

  # get '/signin', to: 'devise_token_auth/sessions#new'
  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   sessions: 'users/sessions'
  # }

  root 'articles#index'
  resources :articles do 
    resources :comments
  end
   resources :comments

end
