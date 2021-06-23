Rails.application.routes.draw do
  resources :token_mappings
  root "snippets#index"

  resources :generators
  resources :snippets
  resources :tags

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
