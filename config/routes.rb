Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "raids" => "raids#index"
  get "raid/new" => "raids#new"
  post "raid/create" => "raids#create"
  get "raids/:id/edit" => "raids#edit"
  post "raids/:id/update" => "raids#update"
  get "pokemons" => "pokemons#index"
  get "pokemon/new" => "pokemons#new"
  post "pokemon/create" => "pokemons#create"
  get "user/new" => "users#new"
  post "user/create" => "users#create"
  get "login" => "sessions#login_form"
  post "login" => "sessions#login"
  post "logout" => "sessions#logout"
  get "places" => "places#index"
  get "place/new" => "places#new"
  post "place/create" => "places#create"
end
