Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  resources :doctor, only: %i[index create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
