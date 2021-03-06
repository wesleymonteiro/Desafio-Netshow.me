Rails.application.routes.draw do
  devise_for :users
  root to: "videos#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: %i[show new create]
  resources :videos do
    post :increment_view, on: :member
  end
end
