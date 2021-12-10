Rails.application.routes.draw do

  resources :tickets
  resources :inventories
  resources :orderlines
  resources :orders
  resources :products
  resources :beverages
  resources :timetables
  resources :chairs
  resources :movies
  resources :theaters
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'login', to: 'account#login'
  post 'login', to: 'account#check_login'
  get 'register', to: 'account#register'
  post 'register', to: 'account#create_user'

  get 'main', to: 'main#main'
  get 'timetable/:name', to: 'main#show_timetable'
  post 'buyticket', to: 'main#buy_ticket'
  get 'ordersummary', to: 'main#order_summary'
  post 'ordersummary', to: 'main#post_order_summary'
  get 'createorder', to: 'main#create_order'
end
