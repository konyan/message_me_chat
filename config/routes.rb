Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "chatsroom#index"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

end
