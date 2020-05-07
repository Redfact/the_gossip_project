Rails.application.routes.draw do
 	
  root to: 'welcome#view'	
  get 'welcome/:name' , to: 'welcome#view', as: 'welcome'
  get 'contact/contactView'
  get 'team/teamView'

  
  resources :gossips ,:authors, :cities ,:comments
  resources :sessions, only: [:new, :create, :destroy]
  resources :likes , only: [:new, :create, :destroy]
end

