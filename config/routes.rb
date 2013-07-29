GoodFriend::Application.routes.draw do
  root to: "friends#index"
  resources :friends
  resources :favorites
end
