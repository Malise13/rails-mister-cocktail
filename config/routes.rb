Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [:new, :create]
  end

  get "cocktails/:cocktail_id/doses", to: "doses#index"
  get "cocktails/:cocktail_id/doses/new", to: "doses#new"
  post "cocktails/:cocktail_id/doses", to: "doses#create"
  get "doses/:id", to: "doses#show"
  get "doses/:id/edit", to: "doses#edit"
  patch "doses/:id", to: "reviews#update"
  delete "doses/:id", to: "doses#destroy"
  get "cocktails/:id", to: "cocktails#show"
end
