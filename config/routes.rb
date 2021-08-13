Rails.application.routes.draw do
  
  # ルートを　app\views\pages\home.html.erb　に設定
  root 'pages#home'
  
  devise_for :users, 
              path: '', 
              path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
              controllers: {registrations: 'registrations'}

  get 'pages/home'
  get '/users', to:'users#show'
  get 'rooms/index'
  
  resources :users, only: [:show, :update]
  
  resources :rooms
  
  resources :bookings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
