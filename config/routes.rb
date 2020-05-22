Rails.application.routes.draw do
  resources :urls, except: [:show]
  get  'urls/:url' => 'urls#show', as: "url_show"
  get '/:url' => "urls#redirect"
  root "urls#redirect"
end
