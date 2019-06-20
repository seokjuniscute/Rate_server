Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/register', to: 'register#register'
  post '/login', to: 'login#check'
end
