Rails.application.routes.draw do
  devise_for :users
  root to: 'sites#index'

  resources :sites do
    resources :pages
  end

  get '/pages', to: 'pages#index'
end
