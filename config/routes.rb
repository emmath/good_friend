GoodFriend::Application.routes.draw do
  root to: "birthdays#index"
  resources :friends
  resources :favorites
  resources :birthdays
  match 'auth/:provider/callback', to: "sessions#create"
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
