Rails.application.routes.draw do
  get 'charges/new'
  get 'charges/create'
  root 'articles#index'
  resources :articles do 
    resources :comments
  end
  resources :charges, only: [:new, :create]

  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'users/registrations',
     sessions: 'users/sessions'
   }

  devise_scope :users do 
    match '/auth/sign_out/:id' => 'users/sessions#destroy',
      :via => Devise.mappings[:user].sign_out_via
  end

  post '/auth/sign_in'   => 'users/sessions#create'
  delete '/auth/sign_out/:id'  => 'users/sessions#destroy',  as: :auth_sign_out,
    :via => Devise.mappings[:user].sign_out_via

  delete '/auth'  => 'auth#destroy', as: 'user_registration_destroy'
      
end
