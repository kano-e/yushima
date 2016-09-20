# == Route Map
#
#    Prefix Verb   URI Pattern               Controller#Action
#     games GET    /games(.:format)          games#index
#           POST   /games(.:format)          games#create
#  new_game GET    /games/new(.:format)      games#new
# edit_game GET    /games/:id/edit(.:format) games#edit
#      game GET    /games/:id(.:format)      games#show
#           PATCH  /games/:id(.:format)      games#update
#           PUT    /games/:id(.:format)      games#update
#           DELETE /games/:id(.:format)      games#destroy
#

Rails.application.routes.draw do
  resources :activities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :games
end
