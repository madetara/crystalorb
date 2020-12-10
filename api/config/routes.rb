Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
