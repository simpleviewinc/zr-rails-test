Rails.application.routes.draw do
  devise_for :users
  root to: 'sites#index'

  resources :sites do
    resources :pages
  end
  resources :pages

end
