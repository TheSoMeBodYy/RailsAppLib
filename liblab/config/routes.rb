Rails.application.routes.draw do
   resources :libraries
   resources :books
   resources :genres
   resources :authors
   resources :reader_cards
   resources :users

  root "pages#home"
  get "libraries/index"
  get "books/index"
  get "readers_cards/index"
  get "authors/index"
  get "reader_cards/index"
  get "users/index"
end
