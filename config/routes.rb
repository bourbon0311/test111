
Rails.application.routes.draw do
#delete '/books/:id' to: 'books#book_destroy' as: 'dest'
 #get '/' =>'homes#top'
 root 'homes#top'
 get '/homes/about' => 'homes#about'
  resources :homes
 devise_for :users
   devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
end
  resources :users

  	#get '/users/sign_out' => 'devise/sessions#destroy'
  resources :books

  #root 'books#index'
  #resources :users, only: [:new, :create, :index, :show]
end
