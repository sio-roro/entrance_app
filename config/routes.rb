Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
        sessions:      'users/sessions',
        passwords:     'users/passwords',
        registrations: 'users/registrations'
    }
  root 'top#hello'
  get "hello/user"=>"top#user",as:"user_index"
  resources :tweets 
  

  post "comment/create/:tweet_id"=>"comments#create",as:'tweet_comments'
  delete "comment/destroy/:id"=>"comments#destroy",as:"comment_destroy"

  resources :users, :only => [:show]
  post "likes/:tweet_id"=>"likes#create",as:"like"
  delete "likes/:tweet_id"=>"likes#destroy",as:"like_delete"
  post "relationship/:id"=>"relationships#create",as:"relationship_create"
  delete "relationship/:id"=>"relationships#destroy",as:"relationship_destroy"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
