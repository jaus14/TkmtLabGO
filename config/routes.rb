Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "raids" => "raids#index"
  get "raid/new" => "raids#new"
  post "raid/create" => "raids#create"
  get "pokemons" => "pokemons#index"
  get "pokemon/new" => "pokemons#new"
  post "pokemon/create" => "pokemons#create"
  get "users" => "users#index"
  get "user/new" => "users#new"
  post "user/create" => "users#create"
end
