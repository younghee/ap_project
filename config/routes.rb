Rails.application.routes.draw do
  #mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: { sessions: 'sessions' }
  devise_scope :user do
    scope :users, as: :users do
      post 'pre_otp', to: 'sessions#pre_otp'
    end
  end

  resource :two_factor, except: [:index, :show]

  get '/two_factor/email' => "two_factors#email"

  root to: "home#index"
  resources :posts
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
