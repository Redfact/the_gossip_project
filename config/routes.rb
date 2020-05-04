Rails.application.routes.draw do

  get 'gossip/view/:title' , to: "gossip#view" , as: 'gossip'
  get 'welcome/view/:name' , to: 'welcome#view', as: 'welcome'
  get 'contact/contactView'
  get 'team/teamView'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

