Rails.application.routes.draw do
  resources :topics
  resources :forums
  resources :comments
  resources :posts do 
    get '/page/:page', action: :index, on: :collection
  end
  resources :stars, only: [:create, :destroy]
  resources :users, path:'/userprofiles', only: [:index, :show]
  devise_for :users,
  path: '/users', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  defaults: { format: :json },
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
end
