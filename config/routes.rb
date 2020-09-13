Rails.application.routes.draw do
 get '/home/about'
 devise_for :users
 #delete '/books/:id' to: 'books#book_destroy' as: 'dest'
 #get '/' =>'homes#top'
 root 'home#top'
  resources :homes
  resources :users
  	#get '/users/sign_out' => 'devise/sessions#destroy'
  resources :books

  #root 'books#index'
  #resources :users, only: [:new, :create, :index, :show]
end
