# == Route Map
#
#                         Prefix Verb   URI Pattern                                                   Controller#Action
#                                GET    /auth/:providr/callback(.:format)                             sessions#create
#                         logout GET    /logout(.:format)                                             sessions#destroy
#     activity_activity_comments GET    /activities/:activity_id/activity_comments(.:format)          activity_comments#index
#                                POST   /activities/:activity_id/activity_comments(.:format)          activity_comments#create
#  new_activity_activity_comment GET    /activities/:activity_id/activity_comments/new(.:format)      activity_comments#new
# edit_activity_activity_comment GET    /activities/:activity_id/activity_comments/:id/edit(.:format) activity_comments#edit
#      activity_activity_comment GET    /activities/:activity_id/activity_comments/:id(.:format)      activity_comments#show
#                                PATCH  /activities/:activity_id/activity_comments/:id(.:format)      activity_comments#update
#                                PUT    /activities/:activity_id/activity_comments/:id(.:format)      activity_comments#update
#                                DELETE /activities/:activity_id/activity_comments/:id(.:format)      activity_comments#destroy
#                     activities GET    /activities(.:format)                                         activities#index
#                                POST   /activities(.:format)                                         activities#create
#                   new_activity GET    /activities/new(.:format)                                     activities#new
#                  edit_activity GET    /activities/:id/edit(.:format)                                activities#edit
#                       activity GET    /activities/:id(.:format)                                     activities#show
#                                PATCH  /activities/:id(.:format)                                     activities#update
#                                PUT    /activities/:id(.:format)                                     activities#update
#                                DELETE /activities/:id(.:format)                                     activities#destroy
#                          games GET    /games(.:format)                                              games#index
#                                POST   /games(.:format)                                              games#create
#                       new_game GET    /games/new(.:format)                                          games#new
#                      edit_game GET    /games/:id/edit(.:format)                                     games#edit
#                           game GET    /games/:id(.:format)                                          games#show
#                                PATCH  /games/:id(.:format)                                          games#update
#                                PUT    /games/:id(.:format)                                          games#update
#                                DELETE /games/:id(.:format)                                          games#destroy
#                           root GET    /                                                             home#index
#

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/auth/:providr/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :activities do
    resources :activity_comments
  end

  resources :games

  resources :pages, only: [:show]

  root to: 'home#index'
end
