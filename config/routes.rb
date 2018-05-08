Rails.application.routes.draw do
  root 'home#new'
  resource :home
  resource :admin
  resource :session
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
