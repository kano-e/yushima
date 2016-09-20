# == Route Map
#
#        Prefix Verb   URI Pattern                    Controller#Action
#    activities GET    /activities(.:format)          activities#index
#               POST   /activities(.:format)          activities#create
#  new_activity GET    /activities/new(.:format)      activities#new
# edit_activity GET    /activities/:id/edit(.:format) activities#edit
#      activity GET    /activities/:id(.:format)      activities#show
#               PATCH  /activities/:id(.:format)      activities#update
#               PUT    /activities/:id(.:format)      activities#update
#               DELETE /activities/:id(.:format)      activities#destroy
#         games GET    /games(.:format)               games#index
#               POST   /games(.:format)               games#create
#      new_game GET    /games/new(.:format)           games#new
#     edit_game GET    /games/:id/edit(.:format)      games#edit
#          game GET    /games/:id(.:format)           games#show
#               PATCH  /games/:id(.:format)           games#update
#               PUT    /games/:id(.:format)           games#update
#               DELETE /games/:id(.:format)           games#destroy
#

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :activities
  resources :games
end
