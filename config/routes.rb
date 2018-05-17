Rails.application.routes.draw do
  resources :contacts
  resources :abouts
  resources :programs
  resources :news


  root 'home#new'



  resources :home
  resource :admin
  resource :session


  get 'messages/new' => 'messages#new', as: 'new_message'
  post 'messages' => 'messages#create'


  get 'home/show' => 'home#show'
  get 'logout' => 'sessions#destroy'
  get 'admin/new' => 'admin#new'

  get 'sessions/create'

  get 'auth/:provider/callback' => 'admins#create', as: 'auth0_callback'
  get 'auth/auth0', as: 'auth0_login'
  get 'logout' => 'admins#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
