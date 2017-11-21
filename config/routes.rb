Rails.application.routes.draw do
  resources :questionary_results
  resources :questionary_choices
  resources :questionary_items
  resources :questionaries
  get 'questionary_results/calc/:id' , to: 'questionary_results#calc'
  get 'questionary_choices/new/:id' , to: 'questionary_choices#new'
  get 'questionary_items/new/:id' ,to: 'questionary_items#new'
  post 'questionaries/:id' , to: 'questionaries#sendform'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
