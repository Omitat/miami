Rails.application.routes.draw do
  resources :abouts
  resources :programs
  resources :news
  root 'home#new'
  resources :home
  resource :admin
  resource :session
  get 'home/show' => 'home#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
