Rails.application.routes.draw do
 	
  root to: 'welcome#view'	
  get 'author/:id' , to: "author#viewauthor" , as: 'author'
  get 'welcome/:name' , to: 'welcome#view', as: 'welcome'
  get 'contact/contactView'
  get 'team/teamView'

  ###Gossip
  resources :gossips
end

