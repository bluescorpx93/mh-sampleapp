Rails.application.routes.draw do
 
 get 'sessions/new'
 get '/home' => 'static_pages#home'
 get '/help'=> 'static_pages#help'
 resources :users
 # both signup and login in users#new
 get '/signup' => "users#new", as: :common_login
 post 'signup' => "users#create"
	root 'application#hello'
	get '/login' => "sessions#new"
	post '/login' => "sessions#create"
	delete '/logout' => "sessions#destroy"
	get '/users/:id/edit' => "users#edit"
	patch '/users/:id' =>"users#update", as: :update_user
end
