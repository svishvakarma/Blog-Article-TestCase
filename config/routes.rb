Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'users/registrations',
    # sessions: 'users/sessions'
   }

  # devise_for :users,as: :customers

  devise_scope :users do 
  
  end 


  # post '/auth'   => 'users/registrations#create'
  post '/auth/sign_in'   => 'users/sessions#create'
  delete '/auth/sign_out' => 'users/sessions#destroy'

  # root 'users/sessions#new'
  root 'articles#index'
  resources :articles do 
    resources :comments
  end
  resources :comments



 
end
