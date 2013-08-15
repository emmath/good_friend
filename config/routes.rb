GoodFriend::Application.routes.draw do

  root to: "birthdays#index"
  resources :friends
  resources :favorites
  resources :birthdays
  match 'auth/:provider/callback', to: "sessions#create"
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    resources :birthdays
    route to: 'birthdays#index'
  end
  match '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  match '', to: redirect("/#{I18n.default_locale}")
end
