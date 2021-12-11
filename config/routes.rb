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
  get 'logout', to: 'account#logout'

  get 'main', to: 'main#main'
  get 'timetable/:name', to: 'main#show_timetable', as: 'showtime'
  post 'buyticket', to: 'main#buy_ticket'
  get 'ordersummary', to: 'main#order_summary'
  post 'addticket', to: 'main#post_add_ticket'
  get 'createorder', to: 'main#create_order'
  get 'buybeverage', to: 'main#buy_beverage'
  post 'addbeverage', to: 'main#post_add_beverage'
  get 'myorder', to: 'main#show_my_order'

end
