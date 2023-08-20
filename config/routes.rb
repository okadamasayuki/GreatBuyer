Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/find_friend',  to: 'static_pages#find_friend'
  get  '/friends',      to: 'static_pages#friends'
  get  '/one_friend/:display_user_id',   to: 'static_pages#one_friend'

  get  '/new_post',     to: 'posts#new'
  post '/create_post',  to: 'posts#create', as: 'posts'
  resources :posts, only: [:edit, :update, :destroy]

  resources :relations, only: [:create, :destroy]

  get '/login',         to: 'sessions#new'
  post '/login',        to: 'sessions#create'
  delete '/logout',     to: 'sessions#destroy'

  get '/new_user',      to: 'users#new'
  post '/create_user',  to: 'users#create', as: 'users'

end

# cotroller作成
# rails g controller static_pages

# model作成
# rails g model User name:string email:string password_digest:string
# rails g model Post discount:integer price:integer memo:text user:references
# rails g model Relation follower_id:integer followed_id:integer

# modelの有効化
# rails db:migrate

# rails db:migrate:reset
# rails db:seed 