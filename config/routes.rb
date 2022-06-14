Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }
  devise_scope :user do
    scope :users, as: :users do
      post 'pre_otp', to: 'sessions#pre_otp'
    end
  end

  resource :two_factor, except: [:index, :show]

  root to: "home#index"
  resources :posts
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
