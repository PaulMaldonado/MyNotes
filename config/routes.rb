Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :notes
  resources :usuarios, as: :users, only: [:show, :update]

  authenticated :user do
    root 'home#index'
  end

  unauthenticated :user do
    root 'home#unregistered'
  end
  
end
