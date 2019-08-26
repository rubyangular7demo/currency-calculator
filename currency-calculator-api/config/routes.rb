Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'api/status', controller: 'application', action: 'status'
  get 'api/currencies', controller: 'currencies', action: 'index'
  get 'api/refresh', controller: 'currencies', action: 'refresh'

end
