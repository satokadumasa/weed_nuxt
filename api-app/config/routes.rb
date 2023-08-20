Rails.application.routes.draw do
  resources :follows
  resources :note_bookmarks
  resources :page_comments
  resources :board_bookmarks
  resources :board_comments
  resources :boards
  resources :pages
  resources :notes
  resources :user_roles
  resources :roles
  get 'home/index'
  post '/users/remove', to: 'users#remove'
  get '/users/me', to: 'users#me'
  resources :users

  mount_devise_token_auth_for "User", at: "auth", controllers: {
    registrations: "auth/registrations",
    sessions: "auth/sessions",
  }

  # mount_devise_token_auth_for 'User', at: 'auth', skip: [:registrations]
  devise_scope :user do
    post '/account/sign_up' => 'devise_token_auth/registrations#create'
    put '/account' => 'devise_token_auth/registrations#create'
    delete '/account' => 'devise_token_auth/registrations#destroy'
  end
  # WebSocket
  mount ActionCable.server => '/cable'
end
