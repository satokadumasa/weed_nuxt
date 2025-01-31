Rails.application.routes.draw do
  namespace :administrator do
    resources :boards
    resources :board_comments
    resources :notes
    resources :pages
  end
  namespace :normal do
    resources :boards
    resources :board_comments
    resources :board_bookmarks
    resources :notes
    resources :note_bookmarks
    resources :pages
  end

  resources :messages
  resources :vchats
  resources :whispers
  resources :user_rooms
  resources :rooms
  resources :follows
  resources :page_comments
  resources :user_roles
  resources :roles

  get 'home/index'
  post '/users/remove', to: 'users#remove'
  put '/users/update', to: 'users#update'
  get '/users/me', to: 'users#me'
  get '/admins/me', to: 'admins#me'
  resources :users

  # mount_devise_token_auth_for 'User', at: 'auth', skip: [:registrations]

  mount_devise_token_auth_for 'Admin', at: 'admin'
  as :admin do
    # Define routes for Admin within this block.
  end

  mount_devise_token_auth_for "User", at: "auth", controllers: {
    registrations: "auth/registrations",
    sessions: "auth/sessions",
  }

  devise_scope :user do
    post '/account/sign_up' => 'devise_token_auth/registrations#create'
    put '/account' => 'devise_token_auth/registrations#create'
    delete '/account' => 'devise_token_auth/registrations#destroy'
  end
  # WebSocket
  mount ActionCable.server => '/cable'
end
