require 'resque/server'

Rails.application.routes.draw do
  mount Resque::Server.new, at: "/resque"
  resources :urls, except: [:show]
  get  'urls/:url' => 'urls#show', as: "url_show"
  get '/:url' => "urls#redirect", as: "url_redirect"
  root "urls#redirect"
end
