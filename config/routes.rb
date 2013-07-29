GoodFriend::Application.routes.draw do
  root to: "birthdays#index"
  resources :friends
  resources :favorites
  resources :birthdays
end
