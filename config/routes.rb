Rails.application.routes.draw do
  devise_for :users 
  root 'articles#index'
  resources :articles do 
    resources :comments#, #only: [:index, :create, :show, :update, :delete]
  end
   resources :comments#, only: [:show, :create]
  # post '/comments', to: "comments#create"
  # get '/comments/:id', to: "comments#show"

end
