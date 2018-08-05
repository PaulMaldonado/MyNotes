Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :notes

  authenticated :user do
    root 'home#index'
  end

  unauthenticated :user do
    root 'home#unregistered'
  end
  
end
