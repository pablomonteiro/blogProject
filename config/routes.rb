Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles

  # Configuring the root page
  root 'welcome#index' 
end
