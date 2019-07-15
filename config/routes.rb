Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/register', to: 'register#register'
  post '/login', to: 'register#check'
  post '/set_time', to: 'register#set_time'
  get '/get_time', to: 'register#send_time'
  post '/set_reminder', to: 'reminder#get_reminder'
  get '/get_reminder', to: 'reminder#send_reminder'
  post '/set_rating', to: 'create_rate#get_rate'
  get '/get_raing', to: 'create_rate#send_rate'
end
