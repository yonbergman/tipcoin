Rails.application.routes.draw do
  root to: 'application#root'

  get :sign_in, to: "sessions#new"
  post :sign_in, to: "sessions#create"
  get :sign_out, to: "sessions#destroy"


  namespace :api do
    namespace :v1 do
      post :sign_in, to: 'sessions#create'
      resource :user, only: [:show]
      resources :groups, only: [:index, :show, :create] do
        post :invite_user
        resources :transactions, only: [:create]
      end
    end
  end
end
