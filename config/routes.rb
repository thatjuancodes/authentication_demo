Rails.application.routes.draw do
  devise_for :users
  get 'login_with_magic_link', to: 'sessions#login_with_magic_link', as: 'login_with_magic_link'
  post 'magic_link', to: 'sessions#magic_link', as: 'magic_link'
  root to: "home#index"
end
