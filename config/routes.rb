Rails.application.routes.draw do
  root to: 'application#root'

  get :sign_in, to: "sessions#new"
  post :sign_in, to: "sessions#create"
  get :sign_out, to: "sessions#destroy"
end
