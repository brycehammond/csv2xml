Rails.application.routes.draw do

  resources :templates do
    post :csv, on: :member
  end

  root 'templates#index'

end
