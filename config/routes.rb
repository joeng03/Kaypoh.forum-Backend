Rails.application.routes.draw do
  scope 'api' do
    resources :topics
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
  end

  get '*other', to: 'static#index'

end
