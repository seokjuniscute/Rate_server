Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/register', to: 'register#register'
  post '/login', to: 'register#check'
  get '/set_time', to: 'register#set_time'
end
