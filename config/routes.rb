Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "api/auth"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :cats, only: [:index, :update]
    put 'users/image_demo1', to: 'users#image_demo1'
    post 'users/:id/image_demo2', to: 'users#image_demo2'
  end
end
