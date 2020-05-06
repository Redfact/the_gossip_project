Rails.application.routes.draw do
 	
  root to: 'welcome#view'	
  get 'welcome/:name' , to: 'welcome#view', as: 'welcome'
  get 'contact/contactView'
  get 'team/teamView'

  
  resources :gossips ,:authors, :cities ,:comments
end

