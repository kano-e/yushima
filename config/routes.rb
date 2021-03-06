# == Route Map
#
#                         Prefix Verb   URI Pattern                                                    Controller#Action
#                       callback GET    /auth/callback(.:format)                                       sessions#create
#                                GET    /auth/:providr/callback(.:format)                              sessions#create
#                          login GET    /login(.:format)                                               sessions#new
#                         logout GET    /logout(.:format)                                              sessions#destroy
#     activity_activity_comments GET    /activities/:activity_day/activity_comments(.:format)          activity_comments#index
#                                POST   /activities/:activity_day/activity_comments(.:format)          activity_comments#create
#  new_activity_activity_comment GET    /activities/:activity_day/activity_comments/new(.:format)      activity_comments#new
# edit_activity_activity_comment GET    /activities/:activity_day/activity_comments/:id/edit(.:format) activity_comments#edit
#      activity_activity_comment GET    /activities/:activity_day/activity_comments/:id(.:format)      activity_comments#show
#                                PATCH  /activities/:activity_day/activity_comments/:id(.:format)      activity_comments#update
#                                PUT    /activities/:activity_day/activity_comments/:id(.:format)      activity_comments#update
#                                DELETE /activities/:activity_day/activity_comments/:id(.:format)      activity_comments#destroy
#                     activities GET    /activities(.:format)                                          activities#index
#                                POST   /activities(.:format)                                          activities#create
#                   new_activity GET    /activities/new(.:format)                                      activities#new
#                  edit_activity GET    /activities/:day/edit(.:format)                                activities#edit
#                       activity GET    /activities/:day(.:format)                                     activities#show
#                                PATCH  /activities/:day(.:format)                                     activities#update
#                                PUT    /activities/:day(.:format)                                     activities#update
#                                DELETE /activities/:day(.:format)                                     activities#destroy
#                          games GET    /games(.:format)                                               games#index
#                                POST   /games(.:format)                                               games#create
#                       new_game GET    /games/new(.:format)                                           games#new
#                      edit_game GET    /games/:id/edit(.:format)                                      games#edit
#                           game GET    /games/:id(.:format)                                           games#show
#                                PATCH  /games/:id(.:format)                                           games#update
#                                PUT    /games/:id(.:format)                                           games#update
#                                DELETE /games/:id(.:format)                                           games#destroy
#                           page GET    /pages/:id(.:format)                                           pages#show
#                           root GET    /                                                              home#index
#

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/auth/callback', to: 'sessions#create', as: 'callback'
  get '/auth/:providr/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :activities, param: :day do
    resources :activity_comments
  end

  get '/shelf', to: 'shelf#show', as: 'shelf'

  resources :games

  resources :pages, only: [:show]

  root to: 'home#index'
end
