Rails.application.routes.draw do
  root 'pages#index'
  post 'authenticate', to: 'authentication#authenticate'
  namespace :auth do
    post "sign_up", to: "registrations#create"
    delete "destroy", to: "registrations#destroy"
  end
  namespace :api do
    namespace :v1 do
      resources :doctors, only: %i[index create] do
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
