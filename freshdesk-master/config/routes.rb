Freshdesk::Engine.routes.draw do
  #resources :support
  get '/support' => 'support#freshdesk'
  get '/support/login' => 'support#freshdesk_sso_url'
end
