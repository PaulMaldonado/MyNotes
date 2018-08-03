Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'home#index'
  end

  unauthenticated :user do
    root 'home#unregistered'
  end
  
end
